//
//  ViewController.swift
//  WebNativeCommunication
//
//  Created by Lena on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Configuration 만들기
        
        let webViewConfiguration = WKWebViewConfiguration()
        let userContent = WKUserContentController() // 얘가 중요하다 / 얘를 webView의 configuration으로 설정해주는 것
        
        userContent.add(self, name: "SendMessage") // handler가 들어왔을 때 처리해줄 애가 누구냐? 는 것
        userContent.add(self, name: "SayHello")
        userContent.add(self, name: "SetUser")
        // 얘네들은 delegate 패턴이다. -> 1) 프로토콜 2) 메서드 3) 누가할건지? 그걸 정해야 함.
        // add 인이유? : 메세지에 따라서 처리해줄 애를 다르게 만들 수 있는 것.(여러명)
        // 기존에는 하나의 객체에서 처리가 가능한 것
        
        /*
        // MARK: - 대리인 지정의 또 다른 방법
        
        let handler = MessageHandler()
        userContent.add(handler, name: "SetUser")
        */
        
        webViewConfiguration.userContentController = userContent
        // 만든 config를 webViewConfiguration에 넣어주는 것 ! 이걸로 WebView 만든다
        
        // MARK: - webView 생성
        
        var webView = WKWebView(frame: view.frame, configuration: webViewConfiguration)
        
        //MARK: - request 만들기
        
        guard let url = URL(string: "http://127.0.0.1:8080") else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        view.addSubview(webView)
    }
}

extension ViewController: WKScriptMessageHandler {
    // WKScriptMessageHandler는 userContent에 딸려있는 프로토콜이다
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "SendMessage" {
            // 이거일 때 처리해야 할 일
            print("self: SendMessage 메세지! ")
        } else if message.name == "SayHello" {
            print("self: SayHello 메세지! ")
        } else if message.name == "SetUser" {
            print("self: SetUser 메세지! ")
        } else {
            print("else 입니당")
        }
    }
}

/*
class MessageHandler: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("Message Handler: \(message)")
    }
} */
