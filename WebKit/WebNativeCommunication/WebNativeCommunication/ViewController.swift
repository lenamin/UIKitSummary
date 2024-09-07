//
//  ViewController.swift
//  WebNativeCommunication
//
//  Created by Lena on 9/5/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView?
    
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
        
        let frame = CGRect(origin: view.frame.origin,
                           size: CGSize(width: view.frame.width, height: view.frame.height / 3 * 2))
        
        webView = WKWebView(frame: frame, configuration: webViewConfiguration)
        
        //MARK: - request 만들기
        view.addSubview(webView!)
        guard let url = URL(string: "http://127.0.0.1:8080") else { return }
        let request = URLRequest(url: url)
        webView?.load(request)
        
        webView?.uiDelegate = self
    }
    
    // JS 코드에 있는 call_func2() 호출
    @IBAction func action1(_ sender: Any) {
        webView?.evaluateJavaScript("call_func1()")
    }
    
    // JS 코드에 있는 call_func2(title) 호출
    @IBAction func action2(_ sender: Any) {
        let name = "에스파"
        webView?.evaluateJavaScript("call_func2('\(name)')")
    }
    
    @IBAction func action3(_ sender: Any) {
        let info = ["phone": "010-123-1234", "email": "a@a.com", "name": "홍길동", "gender": "male"]
        // JSON 을 일단 만든다
        // 직렬화 한다 (serialization)
        // 왜? -> 이기종이기에 같이 알 수 있는 것으로 보내는 것 (그게 JSON)
        
        do {
            // throw를 던진다 -> 예외가 발생할 때 처리
            // 주는 쪽이 예외처리를 할 수는 없다 -> 받는 쪽으로 예외를 던지는 것!
            // throw 있으면 try - catch 반드시 해야 함
            
            // JS에 데이터를 보낼 준비를 한다.
            let infoData = try JSONSerialization.data(withJSONObject: info) // serialization
            // JSON serialization : JSON을 만들고, 그 JSON으로 data를 다시 만든다
            
            // 받는 타입이 어떤 것이든지 (Any) Data 타입으로 바꿔준다.
            guard let encodedData =  String(data: infoData, encoding: .utf8) else { return }
            
            // encodedData를 보낸다
            // JS의 call_func3 에서 받는다
            webView?.evaluateJavaScript("call_func3('\(encodedData)')", completionHandler: { result, error in
                if let error {
                    return
                }
                guard let info = result as? [String:String] else { return }
                print(info)
            })
        } catch {
            // 예외가 발생했을 때
            print("에러 발생!!!")
        }
    }
}

extension ViewController: WKScriptMessageHandler {
    // WKScriptMessageHandler는 userContent에 딸려있는 프로토콜이다
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "SendMessage" {
            // 이거일 때 처리해야 할 일
            print("self: SendMessage 메세지! ")
            print("message.body: \(message.body)")
            // Any: 변수, 구조체, 클래스 다 올 수 있음
            // AnyObject : 클래스만 올 수 있음
        } else if message.name == "SayHello" {
            print("self: SayHello 메세지! ")
            print("message.body: \(message.body)")
        } else if message.name == "SetUser" {
            print("self: SetUser 메세지! ")
            print("message.body: \(message.body)")
            
            let info = message.body as? [String:String]
            
            // JS 객체를 보냈다. (name, email, phone, gender) 를 보낸것! -> 딕셔너리처럼 생각하면 됨
            if let info {
                print(info["name"]!, info["gender"]!, info["email"]!)
            }
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

extension ViewController: WKUIDelegate {

    // Alert
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler()
        }
        alert.addAction(actionOK)
        
        present(alert, animated: true)
    }
    
    // Confirm
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "확인", style: .default) { _ in
            completionHandler(true)
        }
        let actionCancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            completionHandler(false)
        }
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
    }
    
    // Prompt
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: nil, message: prompt, preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = defaultText
        }
        
        let action = UIAlertAction(title: "입력하세요", style: .default) { _ in
//            let text = alert.textFields?[0].text
            // add로 추가했다는 건 여러개를 넣을 수 있다는 거라서 textFields는 [UITextField] 타입인 것
            
            if let userInput = alert.textFields?[0] {
                let text = userInput.text == "" ? defaultText : userInput.text
                completionHandler(text)
            } else {
                // textField가 Nil이면
                completionHandler(defaultText)
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
}
