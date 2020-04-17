//
//  ProjectView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 4/5/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
import UIKit
struct ProjectView: View {
    @State private var showingConfirmation = false
   var body: some View {
        
       NavigationView{
           // ScrollView(){
        List{
            ForEach(0..<projects.count){
                wire in
                NavigationLink(destination: FolderView(proj:wire)){
                
                
                
                Text(projects[wire].area_code)
                
                 /* if self.ServerData.projects.count != 0 {
                    Text(self.ServerData.projects[0].area_code)
                        }
                */
                
                }.onDisappear(){
                    print(wire)
                }
                
            }
            //wire in 0..<projects.capacity
            
            
        }
            
        .navigationBarTitle("Projects")
        .navigationBarItems(trailing: Button(action: {checkWebsite()
            self.showingConfirmation=true
        }){Text("Fetch Cables")})
        .alert(isPresented: $showingConfirmation){
            if pushMessage == "200"{
                pushMessage = "Fetch Success"
            }
            return Alert(title: Text("Fetch Status"), message: Text(pushMessage), dismissButton: .default(Text("OK")))
                    }
        }.onAppear(){
            searchData[0]=""
          print("Entered Project View")
        }
       .onDisappear(){
        print("Left Project View")
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
