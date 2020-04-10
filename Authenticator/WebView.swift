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
    lazy var myLogin: UITextField = {
          let text = UITextField()
          text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 30.00);
          text.text=""
          text.placeholder="Username"
          text.borderStyle=UITextField.BorderStyle.bezel
          text.backgroundColor=UIColor.blue
          text.textColor=UIColor.black
          text.translatesAutoresizingMaskIntoConstraints = false
          text.layer.cornerRadius = 25
          text.textAlignment = .center
          return text
      }()
    lazy var myPass: UITextField = {
             let text = UITextField()
             text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 30.00);
             text.text=""
             text.placeholder="Password"
             text.borderStyle=UITextField.BorderStyle.bezel
             text.backgroundColor=UIColor.blue
             text.textColor=UIColor.black
             text.translatesAutoresizingMaskIntoConstraints = false
             text.layer.cornerRadius = 25
             text.textAlignment = .center
             text.isSecureTextEntry = true
             return text
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
        //webView.frame = CGRect(x: 0, y: 200, width: 100, height: 200)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        view.addSubview(loginButton)
        view.addSubview(myLogin)
        view.addSubview(myPass)
        loginButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        
        myLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 110).isActive = true
        myLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myLogin.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        myPass.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        myPass.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myPass.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    
    @IBAction func onButtonPressed(_ sender: UIButton){
       // switch counter{
        //case 0:
            let output = myLogin.text!
            var output1 = myPass.text!
            webView.evaluateJavaScript("document.getElementsByName('username')[0].value='\(output)'", completionHandler: {(value,error) in
          // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                print("Inner HTML: \(value) \(output)")
                print("Error \(error)")
                
                
            })
            webView.evaluateJavaScript("document.getElementsByName('password')[0].value='\(output1)'", completionHandler: {(value,error)in
                
                print("Password submission: \(value)")
                print("Error \(error) \(output1)")
                output1 = ""
                self.myPass.text = ""
            })
            userID = self.myLogin.text!
       // case 1:
            webView.evaluateJavaScript("document.getElementsByName('login')[0].submit();", completionHandler: {(value,error) in
                print("Value \(value)")
                
                print("Error \(error)")
            })
      //  case 2: break
        //case 3: break
       // case 4: break
       // case 5: break
       // default:break
            
            
            
        //}
        
        
        
        
      //  counter += 1
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

