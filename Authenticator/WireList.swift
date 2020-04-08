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
	var projNum : Int
	
	
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
		/*
		if folderData.count==2{
			folderData.remove(at: 0)
		}*/
		//folderText = completeFoldersArr[projNum][folderInput]
		folderText=folderData[0]
		print(folderData[0])
		folderText=folderData[0]
		print(folderText)
	}
	@State private var qrbutton :String = "qrbutton"
	
	
	var body: some View {
		//NavigationView {
		//ScrollView(){
		
			VStack{
				HStack{
					Button(action:{
						self.refresh()
						self.delegate?.didTapButton()
					}
					){
						Text("Refresh")
					}
					TextField("Search", text : $searchText, onEditingChanged:  {(changed) in
						if changed != true{
							self.folderText=folderData[0]
						}
						else{
							self.folderText="query"
						}
							})
						
					
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
				//when more rci are available from server "L2D04268" will be replace with the name of the wire
				List(projects[projNum].cables!.filter{($0.Cablenum.lowercased().contains(searchText.lowercased())||searchText=="")&&($0.Jobnum == folderText||folderText == "query")},id:\.self) {wire in 
					
					NavigationLink(destination: WireDetail(wire: wire, projn: self.projNum, rci: (projects[self.projNum].rOfInstall?[0])!)) {
						WireRow(wire:wire, projnumb: self.projNum)
						
	}
					}.id(UUID())
				.navigationBarTitle(Text("Cables"))
				//FolderView().navigationBarHidden(true)
		}.onDisappear(){
			print("Moved out of Wirelist")
			searchData[0]=""
		}.onAppear(){
			print("Wirelist appear")
			//if let index = completeFoldersArr[self.projNum][self.folderInput.firstIndex(of: " ")]
			if let index = self.folderInput.firstIndex(of: " "){
				print("test")
				let distance = self.folderInput.distance(from: self.folderInput.startIndex, to: index)
				print(distance)
				let subfolderInput = self.folderInput[..<index]
				print(subfolderInput)
				let cleanedFolder = String(subfolderInput)
				print(cleanedFolder)
				print(folderData.count)
				print("Folder Input: \(self.folderInput)")
				//folderData.append(cleanedFolder)
				//folderData.remove(at: 0)
				print(folderData.count)
				print(folderData[0])
				//self.folderText="test"
				folderData[0] = cleanedFolder
				//folderData.insert(cleanedFolder, at: 0)
			}
			
			/*
			if let index = self.folderInput.firstIndex(of: " "){
				let distance = self.folderInput.distance(from: self.folderInput.startIndex, to: index)
				print(distance)
				let subfolderInput = self.folderInput[..<index]
				print(subfolderInput)
				folderData[0]=String(subfolderInput)
				//FolderView().navigationBarHidden(true)
			}*/
			//refresh()
			//RegisterViewController().view.isHidden = false
			//self.refresh()
			
			
			Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false){timer in
				self.refresh()
			}
			
		}
	}
		
}
//}


struct WireList_Previews: PreviewProvider {
	static var previews: some View {
		
		ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
			WireList(folderInput: folderArr[0], projNum: 0 )
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
 
