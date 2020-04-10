//
//  WebView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 4/2/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
import WebKit

class WebView: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var username:UITextField!
    
    var webView: WKWebView!
    //let webView = WKWebView()
   var counter = 0
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    override func loadView() {
        webView=WKWebView()
        
         webView.navigationDelegate = self
        view=webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url=URL(string: "https://www6.slac.stanford.edu/slac-staff")!
        let url = URL(string: "https://intranet.slac.stanford.edu/")!
        webView.frame = CGRect(x: 0, y: 200, width: 100, height: 200)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        view.addSubview(loginButton)
        loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    @IBAction func onButtonPressed(_ sender: UIButton){
        switch counter{
        case 0:
            webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                print("Inner HTML: \(value)")
                print("Error \(error)")
                
                
            })
        case 1: break
        case 2: break
        case 3: break
        case 4: break
       // case 5: break
        default:break
            
            
            
        }
        
        
        
        
        counter += 1
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

