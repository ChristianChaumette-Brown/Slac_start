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
        
        var commonView = UINib(nibName: "WireList", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WireList
        commonView.delegate = self
        //firstView.addSubview(commonView)
        let wireViewer = UIHostingController(rootView: WireList())
        
        addChild(wireViewer)
        wireViewer.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wireViewer.view)
        //wireViewer.delegate=self
        wireViewer.didMove(toParent: self)
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
    
    weak var delegate : CustomViewProtocol? = nil
    
        
    
    lazy var newWire=wireData.filter{$0.name.contains(searchText)||searchText==""}
    @State private var qrbutton :String = "qrbutton"
   
    
    var body: some View {
        
        
        
        NavigationView {
           
            VStack{
                HStack{
                TextField("Search", text : $searchText)
                    //.padding(.horizontal, 21.0)
                Button(action:{
                   
                    self.delegate?.buttonTapped()
                }){
                    Text("QR Scanner")
                    
                }
                   
                   
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

extension QRSViewController : CustomViewProtocol{
    func buttonTapped() {
        //let scanVC = QRViewController()
        let scanVC = RegisterViewController()
        addChild(scanVC)
               scanVC.view.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview(scanVC.view)
               scanVC.didMove(toParent: self)
        //let scanVC = RegisterViewController()
        //self.navigationController?.pushViewController(scanVC, animated: true)
    }
}
