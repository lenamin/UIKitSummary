//
//  BookTableViewController.swift
//  BookFinder
//
//  Created by Lena on 9/6/24.
//

import UIKit

class BookTableViewController: UITableViewController {

    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchWithQuery("사랑", page: 1)
    }

    func searchWithQuery(_ query: String?, page: Int) {
        
        guard let query else { return print("검색어를 입력하세요")
        }
        
        let endPoint = "https://dapi.kakao.com/v3/search/book?query=\(query)&page=\(page)"
        
        guard let strURL = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: endPoint) else { return }
        
        var request = URLRequest(url: url)
        
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        guard let apiKey else { return }
        
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error {
                print("error 발생~")
                return
            }
            
            guard let data else { return }
            
            do {
                guard let rootObject = try JSONSerialization.jsonObject(with: data) as? [String: Any], let documents = rootObject["documents"] as? [[String:Any]] else { return }
                let first = documents[0]
                if let title = first["title"] as? String {
                    print(title)
                }
            } catch {
                print("JSON parsing error 발생!")
            }
        }
        
        task.resume()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
}

extension BookTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        searchWithQuery(searchBar.text, page: page)
    }
}
