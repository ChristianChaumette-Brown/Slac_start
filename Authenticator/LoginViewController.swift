//
//  LoginViewController.swift
//  UINavigationController-Example
//
//  Created by strawb3rryx7 on 12.12.2017.
//  Copyright © 2017 strawb3rryx7. All rights reserved.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    //var text:String=passwd
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        addData()
        //qrShow()
        let qr = RegisterViewController()
               print("QRaction recieved")
               addChild(qr)
               qr.view.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(qr.view)
               //qr.view.isHidden = true
               qr.didMove(toParent: self)
              // self.navigationController?.pushViewController(RegisterViewController(), animated: true)
               NSLayoutConstraint.activate([
                          qr.view.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.2),
                          qr.view.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05),
                          qr.view.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 150),
                          qr.view.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -220)
                      ])
       
      // view.addSubview(loginButton)
        
        view.backgroundColor = UIColor.blue
       // loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
      //  loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      //  loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      //  loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    @objc func onButtonPressed(_ sender: UIButton) {
    if sender == loginButton {
        //text=ContentView()
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

 extension LoginViewController {
    
     func addData(){
        
        var user = User()
        let controller = UIHostingController(rootView: WireList())
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
       // controller.didMove(toParent: self)
        //let controller = QRSViewController()
        //self.navigationController?.pushViewController(controller, animated: true)
        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
       
    }
    func qrShow(){
        //let qr = ScannerViewController()
        let qr = RegisterViewController()
        print("QRaction recieved")
        addChild(qr)
        qr.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qr.view)
        qr.view.isHidden = true
        qr.didMove(toParent: self)
       // self.navigationController?.pushViewController(RegisterViewController(), animated: true)
        NSLayoutConstraint.activate([
                   qr.view.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.2),
                   qr.view.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05),
                   qr.view.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 150),
                   qr.view.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -240)
               ])
    }
    
    
}

