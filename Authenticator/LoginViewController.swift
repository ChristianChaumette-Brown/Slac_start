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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        addData()

        view.backgroundColor = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

private extension LoginViewController {
    
    func addData(){
        var user = User()
        let controller = UIHostingController(rootView: ContentView(login: loginData[0]).environmentObject(user))
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)
        let qr = QRSViewController()
        addChild(qr)
        qr.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(qr.view)
        controller.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            qr.view.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.2),
            qr.view.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05),
            qr.view.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 150),
            qr.view.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -220)
        ])
    }
}
