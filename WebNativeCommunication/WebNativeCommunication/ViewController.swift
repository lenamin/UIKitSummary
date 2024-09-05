//
//  ViewController.swift
//  WebNativeCommunication
//
//  Created by Lena on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "http://127.0.0.1:8080") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

