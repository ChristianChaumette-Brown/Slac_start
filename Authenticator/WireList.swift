//
//  WireList.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//
import AVFoundation

import SwiftUI
class QRSViewController: UIViewController{
    
    lazy var qrbutton:UIButton = {
        let button = UIButton()
        button.setTitle("QRread", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let controller = UIHostingController(rootView:WireList())
        addChild(controller)
          controller.view.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(controller.view)
          controller.didMove(toParent: self)
        view.backgroundColor = UIColor.purple
        view.addSubview(qrbutton)
        qrbutton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        qrbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        qrbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        qrbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //var commonView = UINib(nibName: "WireList", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WireList
        //commonView.delegate = self
        //view.addSubview(commonView.view)
       // let wireViewer = UIHostingController(rootView: WireList())
        //wireViewer.delegate = self
        //addChild(wireViewer)
        //wireViewer.view.translatesAutoresizingMaskIntoConstraints = false
        
       // view.addSubview(wireViewer.view)
        //wireViewer.delegate=self
       // wireViewer.didMove(toParent: self)
    }
    
    @objc func onButtonPressed(_ sender: UIButton) {
         if sender == qrbutton {
            //let registerVC = RegisterViewController()
            //let registerVC = QRViewController()
            let QRVC = QRViewController()
            self.navigationController?.pushViewController(QRVC, animated: true)
        }
    }

}

protocol CustomViewProtocol : NSObjectProtocol{
    func buttonTapped()
}


struct WireList: View {
    
  let searchController = UISearchController(searchResultsController: nil)
    var searchBar = UISearchBar()
    @State var i : Int = 0
    @State  var searchText :String = ""
    @State var qrText:String = ""
     var viewState:Bool = true
    let control = UIViewController(nibName: "QRSViewController", bundle: nil)
    weak var delegate : CustomViewProtocol? = nil
    
        
    
    lazy var newWire=wireData.filter{$0.name.contains(searchText)||searchText==""||qrText==""||$0.name.contains(qrText)}
    @State private var qrbutton :String = "qrbutton"
   
    
    var body: some View {
        
        
        
        NavigationView {
           
            VStack{
                HStack{
                    
                TextField("Search", text : $searchText)
                    //NavigationLink(destination: CodeScannerView())
                    
                }
                List(wireData.filter{$0.name.contains(searchText.lowercased())||searchText==""}) {wire in
                    
                    NavigationLink(destination: WireDetail(wire: wire)) {
                        
                        WireRow(wire:wire)
                        
                    }
                    
                    
                }
                    
                .navigationBarTitle(Text("Wires"))
                
                
            }
        }
    }
}


struct WireList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            WireList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    
}


private extension QRSViewController{
    func addQR(){
        self.navigationController?.pushViewController(QRViewController(), animated: true)
    }
}

extension LoginViewController : CustomViewProtocol{
    func buttonTapped() {
        //let scanVC = QRViewController()
        let scanVC = RegisterViewController()
        addChild(scanVC)
               scanVC.view.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(scanVC.view)
               scanVC.didMove(toParent: self)
        //let scanVC = RegisterViewController()
        //self.navigationController?.pushViewController(scanVC, animated: true)
        NSLayoutConstraint.activate([
            scanVC.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            scanVC.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            scanVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scanVC.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
public func isVisible(view: UIView) -> Bool {

  if view.window == nil {
    return false
  }

  var currentView: UIView = view
  while let superview = currentView.superview {

    if (superview.bounds).intersects(currentView.frame) == false {
      return false;
    }

    if currentView.isHidden {
      return false
    }

    currentView = superview
  }

  return true
}
