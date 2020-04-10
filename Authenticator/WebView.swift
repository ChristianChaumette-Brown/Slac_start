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
   // var timer = Timer()
    var webView: WKWebView!
    //let webView = WKWebView()
   var counter = 0
    var vertOffs = 0
    var offsetX : CGFloat = 0
    var offsetY : CGFloat = 0
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
          text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 5.00);
          text.text=""
          text.placeholder="Username"
          //text.borderStyle=UITextField.BorderStyle.roundedRect
          text.backgroundColor=UIColor.clear
          text.textColor=UIColor.black
        text.layer.borderColor = UIColor.clear.cgColor
          text.translatesAutoresizingMaskIntoConstraints = false
          text.layer.cornerRadius = 25
          text.textAlignment = .left
          return text
      }()
    lazy var myPass: UITextField = {
             let text = UITextField()
             text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 20.00);
             text.text=""
             text.placeholder="Password"
             //text.borderStyle=UITextField.BorderStyle.bezel
             text.backgroundColor=UIColor.clear
             text.textColor=UIColor.black
        text.layer.borderColor = UIColor.clear.cgColor
             text.translatesAutoresizingMaskIntoConstraints = false
             text.layer.cornerRadius = 25
             text.textAlignment = .left
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
       // timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        //let url=URL(string: "https://www6.slac.stanford.edu/slac-staff")!
        let url = URL(string: "https://intranet.slac.stanford.edu/")!
        //webView.frame = CGRect(x: 0, y: 200, width: 100, height: 200)
       // view.frame.size
        
        webView.sizeThatFits(view.frame.size)
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
       // webView.scrollView.isScrollEnabled = false
        //webView.scrollView.bounces = false
       // webView.scrollView.canCancelContentTouches = true
        //webView.scrollView.bouncesZoom = false
        offsetX = webView.scrollView.contentOffset.x
        offsetY = webView.scrollView.contentOffset.y
        // Add observer
        webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)

        // Observe value
       /*
        print("\(offsetX) : \(offsetY)")
        view.addSubview(loginButton)
        //view.addSubview(myLogin)
        view.addSubview(myPass)
        loginButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200).isActive = true
        
       // myLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
       // myLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 138).isActive = true
       // myLogin.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        myPass.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -13).isActive = true
        myPass.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 138).isActive = true
        myPass.widthAnchor.constraint(equalToConstant: 300).isActive = true
        */
    }
    /*
    @objc func timerAction(){
       print("timer fired!")
        webView.evaluateJavaScript("document.getElementsByName('username')[0].offsetTop;", completionHandler: {(value,error) in
        
        print("Vertical offset value \(value)")
        print("Error grabbing offset \(error)")
            self.vertOffs = value! as! Int
            self.myLogin.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: CGFloat(self.vertOffs)).isActive = true
            //self.loadView()
           // self.view.reloadInputViews()
    }
        )}
    */
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
               if let key = change?[NSKeyValueChangeKey.newKey] {
                print("observeValue \(key)") // url value
                let keyString : String = ((key as AnyObject).absoluteString)!.description
                print(keyString)
                if keyString == "https://webauth.slac.stanford.edu/login-simple" {
                    print("Registered login movement")
                    webView.evaluateJavaScript("document.getElementsByName('username')[0].value", completionHandler: {(value,error) in
                         // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                               print("Inner HTML Value check: \(value) ")
                               print("Error \(error)")
                               
                    userID = value.unsafelyUnwrapped as! String
                    print(userID)
                           })
                }
               }
           }
    
    @IBAction func onButtonPressed(_ sender: UIButton){
       // switch counter{
        //case 0:
           // let output = myLogin.text!
            var output1 = myPass.text!
        var vertOffset = 0
        
        webView.evaluateJavaScript("document.getElementsByName('username')[0].value", completionHandler: {(value,error) in
                 // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                       print("Inner HTML Value check: \(value) ")
                       print("Error \(error)")
                       
            userID = value.unsafelyUnwrapped as! String
            print(userID)
                   })
        print(userID)
          /*  webView.evaluateJavaScript("document.getElementsByName('username')[0].value='\(output)'", completionHandler: {(value,error) in
          // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                print("Inner HTML: \(value) \(output)")
                print("Error \(error)")
                
                
            })
        */
            webView.evaluateJavaScript("document.getElementsByName('password')[0].value='\(output1)'", completionHandler: {(value,error)in
                print(userID)
                print("Password submission: \(value)")
                print("Error \(error) \(output1)")
                output1 = ""
                self.myPass.text = ""
            })
        webView.evaluateJavaScript("document.getElementsByName('username')[0].value", completionHandler: {(value,error) in
                 // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                       print("Inner HTML Value check: \(value) ")
                       print("Error \(error)")
                       
                       
                   })

           // userID = output
       // case 1:
            webView.evaluateJavaScript("document.getElementsByName('login')[0].submit();", completionHandler: {(value,error) in
                print("Value \(value)")
                
                print("Error \(error)")
                self.webView.evaluateJavaScript("document.getElementsByName('username')[0].value", completionHandler: {(value,error) in
                    // webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: {(value,error) in
                          print("Inner HTML Value check: \(value) ")
                          print("Error \(error)")
                          
                          
                      })

                self.webView.evaluateJavaScript("document.getElementsByName('username')[0].offsetTop;", completionHandler: {(value,error) in
                    
                    print("Vertical offset value \(value)")
                    print("Error grabbing offset \(error)")
                    vertOffset = value! as! Int
                    
                    
                    
                })
            })
      //  case 2: break
        //case 3: break
       // case 4: break
       // case 5: break
       // default:break
            
       // myLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(vertOffset+8)).isActive = true
            
        //}
        offsetX = webView.scrollView.contentOffset.x
               offsetY = webView.scrollView.contentOffset.y
               
               print("\(offsetX) : \(offsetY)")
        
        
        
      //  counter += 1
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

