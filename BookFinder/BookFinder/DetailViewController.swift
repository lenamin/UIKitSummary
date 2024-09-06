//
//  DetailViewController.swift
//  BookFinder
//
//  Created by Lena on 9/6/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var strURL: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let strURL, let url = URL(string: strURL)
        else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
