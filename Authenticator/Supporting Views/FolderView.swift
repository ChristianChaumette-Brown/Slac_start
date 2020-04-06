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
   // var projName:String
  // @EnvironmentObject var ServerData : DataAssignment
    var proj: Int
    //init(){}
    var body: some View {
        
       //NavigationView{
           // ScrollView(){
        List(completeFoldersArr[proj],id: \.self){ wire in
            NavigationLink(destination: WireList(folderInput: wire, projNum: self.proj)){
                
                
                
                Text(wire)
                
                 /* if self.ServerData.projects.count != 0 {
                    Text(self.ServerData.projects[0].area_code)
                        }
                */
                
                }
            
            }.onAppear(){
                 searchData[0]=""
                 print("showing Cable Groups for project \(self.proj)")
             }
            .onDisappear(){
             print("Left folder view")
             }
            
        .navigationBarTitle("Cable Groups")
        
        //}
    }
}



struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView(proj: 1)
    }
}


