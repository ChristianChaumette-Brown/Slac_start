//
//  WebView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 4/2/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
import WebKit

class ServerTestViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    //let webView = WKWebView()
   
    override func loadView() {
        webView=WKWebView()
         webView.navigationDelegate = self
        view=webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url=URL(string: "https://www6.slac.stanford.edu/slac-staff")!
        let url = URL(string: "http://10.0.0.237:5000/ws/projects/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

