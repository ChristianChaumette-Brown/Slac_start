//
//  WireList.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//
import AVFoundation
import UIKit
import SwiftUI

protocol WirelistDelegate {
   func didTapButton()
}

struct WireList: View {
  let searchController = UISearchController(searchResultsController: nil)
    var searchBar = UISearchBar()
    @State var i : Int = 0
    @State  var searchText :String = ""
    @State  var folderText: String = folderData[0]
    @State var qrText:String = ""
    @State dynamic var scanner:String = searchData[0]
    @State var showingQr = false
     var delegate: WirelistDelegate?
    var folderInput: String
   
   //  var viewState:Bool = true
    //@EnvironmentObject var searcher:searchInfo
  //  let control = UIViewController(nibName: "QRSViewController", bundle: nil)
   // weak var delegate : CustomViewProtocol? = nil
    
        func assign (_ text: String){
               searchText=text
           }
    func refresh(){
        self.scanner=searchData[0]
        //self.scanner="Help"
        print("Refreshed search")
        print(scanner)
        searchText=searchData[0]
         print(folderInput)
        folderText=folderData[0]
        print(folderData[0])
    }
    @State private var qrbutton :String = "qrbutton"
   
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Button(action:{
                        self.refresh()
                        self.delegate?.didTapButton()
                    }
                    ){
                        Text("Refresh")
                    }
                TextField("Search", text : $searchText)
                    //NavigationLink(destination: CodeScannerView())
                    Button(action:{
                        self.showingQr.toggle()
                    }){
                        Text("Qr code")
                    }.sheet(isPresented: $showingQr, onDismiss: {
                        self.refresh()
                    }){
                        QRPickers()
                    }
                    
                }
               //
                List(wireData.filter{($0.Cablenum.lowercased().contains(searchText.lowercased())||searchText=="")&&($0.Jobnum.lowercased().contains(folderText.lowercased())||folderText=="")}) {wire in
                    
                    NavigationLink(destination: WireDetail(wire: wire)) {
                        
                        WireRow(wire:wire)
                        
                    }
                    
                    
                }
                    
                .navigationBarTitle(Text("Wires"))
                
                
            }
        }.onAppear(){
            print("Wirelist appear")
            if let index = self.folderInput.firstIndex(of: " "){
                let distance = self.folderInput.distance(from: self.folderInput.startIndex, to: index)
                print(distance)
                let subfolderInput = self.folderInput[..<index]
                print(subfolderInput)
                folderData[0]=String(subfolderInput)
            }
            //refresh()
            RegisterViewController().view.isHidden = false
            self.refresh()
        }.onDisappear(){
            print("Moved out of Wirelist")
        }
    }
}


struct WireList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            WireList(folderInput: folderArr[0] )
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
    
}




struct QRPickers: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ScannerViewController {
        //let picker = UIViewController()
        //return picker
        return ScannerViewController()
    }
    
    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {
        
    }
    
   // typealias UIViewControllerType = <#type#>
    
  // typealias UIViewControllerType = UIViewController

}
