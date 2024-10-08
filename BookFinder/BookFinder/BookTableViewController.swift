//
//  BookTableViewController.swift
//  BookFinder
//
//  Created by Lena on 9/6/24.
//

import UIKit

class BookTableViewController: UITableViewController {

    var page = 1 {
        didSet {
            prevButton.isEnabled = page > 1
            searchWithQuery(searchBar.text, page: page)
        }
    }
    var documents: [[String:Any]]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var prevButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prevButton.isEnabled = false
        nextButton.isEnabled = false
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        page += 1
    }
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        page -= 1
    }
    
    func searchWithQuery(_ query: String?, page: Int) {
        
        guard let query else { return print("검색어를 입력하세요")
        }
        
        let endPoint = "https://dapi.kakao.com/v3/search/book?query=\(query)&page=\(page)"
        
        guard let strURL = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: strURL) else { return }
        
        var request = URLRequest(url: url)
        
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        guard let apiKey else { return }
        
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error {
                print("\(error) error 발생~")
                return
            }
            
            guard let data else { return }
            
            do {
                guard let rootObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                self.documents = rootObject["documents"] as? [[String:Any]]
                
                if let meta = rootObject["meta"] as? [String:Any],
                   let isEnd = meta["is_end"] as? Bool {
                    DispatchQueue.main.async {
                        self.nextButton.isEnabled = !isEnd
                    }
                }
                   
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("JSON parsing error 발생!")
            }
        }
        task.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        documents?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath)
        
        guard let book = documents?[indexPath.row] else { return  cell }
        let imageView = cell.viewWithTag(1) as? UIImageView
        
        let titleLabel = cell.viewWithTag(2) as? UILabel
        titleLabel?.text = book["title"] as? String
        
        let authorLabel = cell.viewWithTag(3) as? UILabel
        let authors = book["authors"] as? [String]
        authorLabel?.text = authors?.joined(separator: ", ")
        
        let publisherLabel = cell.viewWithTag(4) as? UILabel
        publisherLabel?.text = book["publisher"] as? String
        
        let priceLabel = cell.viewWithTag(5) as? UILabel
        priceLabel?.text = "\((book["price"] as? Int) ?? 0)원"
        
        if let thumbnail = book["thumbnail"] as? String {
            if let url = URL(string: thumbnail) {
                print("url: \(url)")
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data {
                        DispatchQueue.main.async {
                            imageView?.image = UIImage(data: data)
                        }
                    }
                }
                task.resume()
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as? DetailViewController
        guard let indexPath = tableView.indexPathForSelectedRow,
              let book = documents?[indexPath.row]
        else { return }
        
        detailViewController?.strURL = book["url"] as? String
    }
}

extension BookTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        searchBar.resignFirstResponder()
    }
}
