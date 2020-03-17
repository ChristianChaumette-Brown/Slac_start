//
//  WireList.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//
import AVFoundation

import SwiftUI

struct WireList: View {
    
   

  let searchController = UISearchController(searchResultsController: nil)
    var searchBar = UISearchBar()
    @State var i : Int = 0
    @State  var searchText :String = ""
    @State var qrText:String = ""
    @State dynamic var scanner:String = searchData[0]
    
     var viewState:Bool = true
    //@EnvironmentObject var searcher:searchInfo
    let control = UIViewController(nibName: "QRSViewController", bundle: nil)
   // weak var delegate : CustomViewProtocol? = nil
    
        func assign (_ text: String){
               searchText=text
           }
    func refresh(){
        //let qrvc = ScannerViewController()
    
        self.scanner=searchData[0]
        //self.scanner="Help"
        print(scanner)
        searchText=searchData[0]
    }
    
    lazy var newWire=wireData.filter{$0.name.contains(searchText)||searchText==""||qrText==""||$0.name.contains(qrText)}
    @State private var qrbutton :String = "qrbutton"
   
    
    var body: some View {
        
        
        
        NavigationView {
           
            VStack{
                HStack{
                    //Text(scanner)
                    //Text("Pudding")
                    Button(action:{
                        self.refresh()
                    }
                    ){
                        Text("Refresh")
                    }
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
            WireList( )
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    
}




