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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
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
    

}

protocol CustomViewProtocol : NSObjectProtocol{
    func buttonTapped()
}


struct WireList: View {
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar = UISearchBar()
    @State var i : Int = 0
    @State private var searchText :String = ""
    
    let control = UIViewController(nibName: "QRSViewController", bundle: nil)
    weak var delegate : CustomViewProtocol? = nil
    
        
    
    lazy var newWire=wireData.filter{$0.name.contains(searchText)||searchText==""}
    @State private var qrbutton :String = "qrbutton"
   
    
    var body: some View {
        
        
        
        NavigationView {
           
            VStack{
                HStack{
                TextField("Search", text : $searchText)
                    //.padding(.horizontal, 21.0)
                /*Button(action:{
                   // delegate?.buttonTapped()
                    //NavigationLink
                    
                    self.delegate?.buttonTapped()
                   LoginViewController().buttonTapped()
                }){
                    Text("QR Scanner")
                    
                }*/
                   
                   
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
