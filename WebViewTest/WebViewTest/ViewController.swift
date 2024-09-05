//
//  ViewController.swift
//  WebViewTest
//
//  Created by Lena on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func naverButtonTapped(_ sender: Any) {
        requestURL(name: .naver)
    }
    
    @IBAction func daumButtonTapped(_ sender: Any) {
        requestURL(name: .daum)
    }
    
    @IBAction func googleButtonTapped(_ sender: Any) {
        requestURL(name: .google)
    }
    
    func requestURL(name: Domain) {
        let url = URL(string: name.rawValue)
        // 반환형은 Optional 이다!
        guard let url else {
            return
        }
        
        // request 만들기
        let request = URLRequest(url: url)
        
        // request 보내기
        webView.load(request)
    }
}

enum Domain: String {
    case daum = "https://daum.net"
    case naver = "https://naver.com"
    case google = "https://google.com"
}
