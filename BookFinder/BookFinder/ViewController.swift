//
//  ViewController.swift
//  BookFinder
//
//  Created by Lena on 9/6/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        search()
    }

    func search() {
        let endPoint = "https://dapi.kakao.com/v3/search/book?query=love"
        guard let url = URL(string: endPoint) else { return }
        
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
}

