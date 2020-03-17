//
//  ContentView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/24/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

 struct ContentView: View {
   // @Environment(\.editMode) var mode
    //let login = Bundle.main.decode(User.self, from: "Server.json")
    @State  var selection : Int? = nil
    @State private var usern: String = ""
      @State private var passw: String = ""
      @EnvironmentObject var user: User
    @State var log: String = "in"
    //@EnvironmentObject var user2:User
    @State var login:Login
    
    //var login:[loginData0]
    @ State private var i : Int = 0
    //var logged : Login
    
   // var  confirm_user : String
   // var  confirm_pass : String
    //var  confirm_auth : Bool
    
   // private var isResfreshing = true
   // var login : Login?
    
    
   
     public var body: some View {
        NavigationView{
          VStack(alignment: HorizontalAlignment .leading){
            
            
            TextField("Username", text: $usern)
              SecureField("Password", text: $passw)
           
           NavigationLink(destination:WireList(),tag: 1, selection: $selection){
            Button(action: {
               // RegisterViewController().viewDidLoad()
                self.user.acq().self
                self.user.acq()
                self.user.usern=self.usern
                self.user.passw=self.passw
                self.i = 0
              
               // loginData.removeAll()
                //loginData.insert(load2("ServerRec2.json"), at:0)
                loginData[0]=load2("ServerRec2.json")
                self.user.confirmed=loginData[0].name
                self.user.cpass=loginData[0].password
           
                if
                    self.user.usern==self.user.confirmed&&self.user.passw==self.user.cpass{
                     self.selection = 1
                    //LoginViewController().viewDidLoad()
                    //LoginViewController().
                }
                else{
                    self.i = 1
                }
               
                
            }) {
                Text("Login")
            }
            }
            Button(action:{
                self.user.acq()
                self.user.usern=self.user.confirmed
                self.user.passw=self.user.cpass
            }){
                Text("Forgot Username/Password")
                
            }
                   
              /*  NavigationLink(destination: DetailedView()) {
                    Text("Show Detail View")
                    
                }
 */
                .padding()
            if self.i==1{
                Text("Failed Login Attempt")
            }
            
            }
        
    //.padding()
            
           // .padding()
            }
    

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //@EnvironmentObject var user: User
        ContentView(login: loginData[0])
        
    }
}

struct DetailedView : View{
    
    @EnvironmentObject var user: User
    var body :some View{
        VStack{
        Text("User Name \(user.usern)")
        Text("Pasword \(user.passw)")
        }
    }
}

