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
	@State var index: Int = 0
	@State private var confirmationMessage = ""
	@State private var showingConfirmation = false
	@State private var showingFailed = false
	@State var message : String = ""
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
						self.postChanges()
					}){Text("Upload Changes")}
					
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
					
					NavigationLink(destination: WireDetail(wire: wire, projn: self.projNum)) {
						WireRow(wire:wire, projnumb: self.projNum)
						
	}
					}.id(UUID())
				.navigationBarTitle(Text("Cables"))
					//.navigationBarItems(trailing: Button(action: {checkWebsite()}){Text("Fetch Cables")})
					.alert(isPresented: $showingConfirmation){
						Alert(title: Text("Push Status"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
				}
					/*
				.alert(isPresented: $showingFailed){
					Alert(title: Text("Push Failed"), message: Text(message),dismissButton: .default(Text("OK")))
				}*/
				
				//FolderView().navigationBarHidden(true)
		}.onDisappear(){
			print("Moved out of Wirelist")
			searchData[0]=""
			//self.index = projects[self.projNum].rOfInstall!.firstIndex( where: {$0.Cablenum == "L2D04268"})!
			//print(self.index)
			//print(projects[self.projNum].rOfInstall?.lastIndex(of: projects[self.projNum].rOfInstall[))
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
	func postChanges(){
		print(changes)
		print(changes.count)
		print(changes.capacity)
		guard let encoded = try? JSONEncoder().encode(changes) else {
			print("Failed to encode order")
			
			return
		}
		print(changes.count)
		if changes.count==0{self.confirmationMessage="No Changes to Push"}
		if changes.count>0{self.confirmationMessage="Server Push Success"}
		let url = URL(string:"\(server)/ws/\(projects[projNum].area_code)/rci_updates/" )!
		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		request.httpBody = encoded
		URLSession.shared.dataTask(with: request){ data, response, error in
			// handle the result here.
			guard let data = data else {
				print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
				self.confirmationMessage = error?.localizedDescription ?? "Unknown error"
				self.showingConfirmation=true
				
				return
			}
			
			self.showingConfirmation = true
			print("Server Push Success")
			
			print(data)
		}.resume()
		changes.removeAll()
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
 
