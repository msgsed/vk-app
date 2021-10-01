//
//  VKAuthViewController.swift
//  vk-app
//
//  Created by Sergey Dmitriev on 30.09.2021.
//

import UIKit
import WebKit

class Session {
    static let shared = Session()
    private init(){}
    
    var token = ""
}

class VKAuthViewController: UIViewController {
        
    let fromAuthToNavi = "fromAuthToNavi"
    
    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7868149"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        let request = URLRequest(url: urlComponents.url!)
        webview.load(request)
    }
}

extension VKAuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        if let token = params["access_token"] {
            Session.shared.token = token
        }
                
        print(Session.shared.token)

        performSegue(withIdentifier: self.fromAuthToNavi, sender: self)
        
        decisionHandler(.cancel) }
}
