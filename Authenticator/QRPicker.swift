//
//  QRPicker.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 3/24/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//
import UIKit
import SwiftUI

struct QRPicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> RegisterViewController {
        //let picker = UIViewController()
        //return picker
        return RegisterViewController()
    }
    
    func updateUIViewController(_ uiViewController: RegisterViewController, context: Context) {
        
    }
    
   // typealias UIViewControllerType = <#type#>
    
  // typealias UIViewControllerType = UIViewController

}
