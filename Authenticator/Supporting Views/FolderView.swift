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
    
  // @EnvironmentObject var ServerData : DataAssignment
    
    init(){
    }
    var body: some View {
        
       NavigationView{
           // ScrollView(){
        List(folderArr,id: \.self){ wire in
            NavigationLink(destination: WireList(folderInput: wire)){
                
                
                
                Text(wire)
                
                 /* if self.ServerData.projects.count != 0 {
                    Text(self.ServerData.projects[0].area_code)
                        }
                */
                
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

/*

struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView( )
    }
}

*/
