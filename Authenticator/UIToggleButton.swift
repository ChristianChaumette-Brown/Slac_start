//
//  UIToggleButton.swift
//  Authenticator
//
//  Created by Nicholas Deters on 3/9/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import Foundation

//class UIToggleButton:UIButton{
//    var isOn:Bool = false{
//        didSet{
//            updateDisplay()
//        }
//    }
//    var onImage:UIImage! = nil{
//        didSet{
//            updateDisplay()
//        }
//    }
//    var offImage:UIImage! = nil{
//        didSet{
//            updateDisplay()
//        }
//    }
//
//    func updateDisplay(){
//        if isOn {
//            if let onImage = onImage{
//                setBackgroundImage(onImage, for: .normal)
//            }
//        } else {
//            if let offImage = offImage{
//                setBackgroundImage(offImage, for: .normal)
//            }
//        }
//    }
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        super.endTracking(touch, with: event)
//        isOn = !isOn
//    }
//}
