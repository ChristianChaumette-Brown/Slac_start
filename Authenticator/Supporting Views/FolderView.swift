//
//  FolderView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 3/31/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
import UIKit

struct FolderView: View {
    @State private var actionState: Int? = 0
    
    var body: some View {
       NavigationView{
           // ScrollView(){
        List(folderArr,id: \.self){ wire in
            NavigationLink(destination: WireList(folderInput: wire)){
                
                
                
                Text(wire)
                  
                
                }
            
        }
        .navigationBarTitle("Folders")
        
        }.onAppear(){
            searchData[0]=""
        
        }
       .onDisappear(){
        print("Left folder view")
        }
    }
}



struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView()
    }
}


