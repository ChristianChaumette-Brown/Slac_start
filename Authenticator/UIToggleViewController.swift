//
//  UIToggleViewController.swift
//  Authenticator
//
//  Created by Nicholas Deters on 3/9/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import Foundation

//class ViewController: UIViewController {
//    @IBOutlet weak var basicSwitch: UISwitch!
//
//
//    var toggleButton: UIToggleButton!
//
//    //Action when button recieves touchUpInside
//    @IBAction func didToggleButton(_ sender: UIToggleButton) {
//        if sender.isOn {
//            sender.setTitle("ON", for: .normal)
//        } else {
//            sender.setTitle("OFF", for: .normal)
//        }
//    }
//
//    //Configure the toggle button for this app.
//    func configureToggleButton()-> UIToggleButton{
//        let toggleButton = UIToggleButton()
//        toggleButton.offImage = UIImage(named: "Toggle off")
//        toggleButton.onImage = UIImage(named: "Toggle on")
//        toggleButton.setTitleColor(.black, for: .normal)
//        toggleButton.titleLabel?.font = UIFont(name: "Gill Sans", size: 36)
//        toggleButton.setTitle("OFF", for: .normal)
//        toggleButton.addTarget(self, action: #selector(didToggleButton(_:)), for: .touchUpInside)
//        return toggleButton
//    }
//
//    //Add the button to the layout centered on the view.
//    func addToggleButton(to view:UIView) {
//        toggleButton = configureToggleButton()
//        view.addSubview(toggleButton)
//        toggleButton.translatesAutoresizingMaskIntoConstraints = false
//        var constraints = [NSLayoutConstraint]()
//        constraints += [NSLayoutConstraint.init(item: toggleButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)]
//         constraints += [NSLayoutConstraint.init(item: toggleButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)]
//         constraints += [NSLayoutConstraint.init(item: toggleButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 128)]
//        constraints += [NSLayoutConstraint.init(item: toggleButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 96)]
//        NSLayoutConstraint.activate(constraints)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addToggleButton(to: view)
//    }
//}
