//
//  WireDetail.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct WireDetail: View {
    var wire: Wire
    var projn: Int
   // var rci: rci=(Cablenum:wire.Cablenum,project:wire.project,INSTALL_STATUS:false,INSTALL_STATUS_user:userID,INSTALL_STATUS_date:dateOut)
   // {"Cablenum": "L2D04268", "project": "LCLSII", "INSTALL_STATUS": true, "INSTALL_STATUS_user": "uid:mshankar", "INSTALL_STATUS_date": dateOut, "VERIFY_SOURCE": true, "VERIFY_SOURCE_user": "uid:mshankar", "VERIFY_SOURCE_date": dateOut, "VERIFY_DEST": true, "VERIFY_DEST_user": "uid:mshankar", "VERIFY_DEST_date": dateOut, "ORIGIN_TERM": true, "ORIGIN_TERM_user": "uid:mshankar", "ORIGIN_TERM_date": dateOut, "DEST_TERM": true, "DEST_TERM_user": "uid:mshankar", "DEST_TERM_date": dateOut, "VERIFY_CONN_ORIGIN": true, "VERIFY_CONN_ORIGIN_user": "uid:mshankar", "VERIFY_CONN_ORIGIN_date": dateOut, "VERIFY_CONN_DEST": true, "VERIFY_CONN_DEST_user": "uid:mshankar", "VERIFY_CONN_DEST_date": dateOut, "TESTED": true, "TESTED_user": "uid:mshankar", "TESTED_date": dateOut, "CONN_ORIGIN": true, "CONN_ORIGIN_user": "uid:mshankar", "CONN_ORIGIN_date": dateOut, "CONN_DEST": true, "CONN_DEST_user": "uid:mshankar", "CONN_DEST_date": dateOut, "RELEASED": true, "RELEASED_user": "uid:mshankar", "RELEASED_date": dateOut, "COMMENT_SOURCE": "Source comment first line", "COMMENT_DEST": "Dest comment first line"}
   // @State var cablenumber : String
    
         @State var tog1 : Bool = true
         @State var tog2 : Bool = false
         @State var tog3 : Bool = false
         @State var tog4 : Bool = false
         @State var tog5 : Bool = false
         @State var tog6 : Bool = false
         @State var tog7 : Bool = false
         @State var tog8 : Bool = false
         @State var tog9 : Bool = false
         @State var tog10 : Bool = false
         @State var tog11 : Bool = false
    
        @State var sheetBool = false
        @State var infoBool = false
    var changedCount: Int = 0
    var changed : Bool = false
    var saved : Bool = false
    var index = -1
    //var chang=changes[0]
    
    @State var installField : String = ""
    
    init(wire: Wire, projn:Int){
        self.wire = wire
        self.projn = projn
        let today = Date()
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: today)!
                   let formatter = DateFormatter()
                   formatter.dateFormat = "yyyy-MM-d'T'HH:mm:ss'Z'"
                   let dateOut = formatter.string(from: modifiedDate)
                   print(dateOut)
                self.index = projects[projn].rOfInstall!.firstIndex( where: {$0.Cablenum == self.wire.Cablenum}) ?? -1
         
        if index == -1 {
           
            var rc = rci (Cablenum:wire.Cablenum,project:projects[projn].area_code,INSTALL_STATUS:false,INSTALL_STATUS_user:userID,INSTALL_STATUS_date:dateOut,VERIFY_SOURCE:false,VERIFY_SOURCE_user:userID,VERIFY_SOURCE_date:dateOut,VERIFY_DEST:false,VERIFY_DEST_user:userID,VERIFY_DEST_date:dateOut,ORIGIN_TERM:false,ORIGIN_TERM_user:userID,ORIGIN_TERM_date:dateOut,DEST_TERM:false,DEST_TERM_user:userID,DEST_TERM_date:dateOut,VERIFY_CONN_ORIGIN:false,VERIFY_CONN_ORIGIN_user: userID,VERIFY_CONN_ORIGIN_date:dateOut, VERIFY_CONN_DEST:false,VERIFY_CONN_DEST_user: userID,VERIFY_CONN_DEST_date:dateOut,TESTED:false,TESTED_user: userID,TESTED_date:dateOut,CONN_ORIGIN:false,CONN_ORIGIN_user: userID,CONN_ORIGIN_date:dateOut,CONN_DEST:false,CONN_DEST_user: userID,CONN_DEST_date:dateOut, RELEASED:false,RELEASED_user: userID,RELEASED_date: dateOut, COMMENT_SOURCE: "Default Source Comment", COMMENT_DEST: "Default Destination Comment"  )
            
            projects[projn].rOfInstall?.append(rc)
            
            index = projects[projn].rOfInstall!.firstIndex( where: {$0.Cablenum == self.wire.Cablenum})!
            print(projects[projn].rOfInstall)
        }
        
        
                print(projects[projn].rOfInstall![self.index].Cablenum)
                self.tog1 = projects[projn].rOfInstall![self.index].INSTALL_STATUS ?? false
                 self.tog2 = projects[projn].rOfInstall![index].VERIFY_SOURCE ?? false
                  self.tog3 = projects[projn].rOfInstall![index].VERIFY_DEST ?? false
                  self.tog4 = projects[projn].rOfInstall![index].ORIGIN_TERM ?? false
                  self.tog5 = projects[projn].rOfInstall![index].DEST_TERM ?? false
                  self.tog6 = projects[projn].rOfInstall![index].VERIFY_CONN_ORIGIN ?? false
                  self.tog7 = projects[projn].rOfInstall![index].VERIFY_CONN_DEST ?? false
                  self.tog8 = projects[projn].rOfInstall![index].TESTED ?? false
                  self.tog9 = projects[projn].rOfInstall![index].CONN_ORIGIN ?? false
                  self.tog10 = projects[projn].rOfInstall![index].CONN_DEST ?? false
                  self.tog11 = projects[projn].rOfInstall![index].RELEASED ?? false
    }
   

    var body: some View {
        
        //toggle cleaning
        
        
        ScrollView{
        //VStack{
            
            VStack(alignment: HorizontalAlignment.leading) {
                
                //care Vstack can only handle 10 children
               // VStack{
                   // Text(wire.name)
                //}
               
                
                
                Group{
                   // Text(String((wire.Cablenum)))
               // .font(.title)
                HStack() {
                    Text("Area Code: \(wire.Area_Code) ")
                        .font(.subheadline)
                    Spacer()
                    Text("Wire Jobnum: ")
                    Text(wire.Jobnum)
                       // .font(.subheadline)
                   
                }
                Group{
            HStack{
                Text("Wire CableType: ")
                
                Text(String(wire.Cabletype)).font(.title)
                
               
            
                
                }
           
           
            
            HStack{
                Text("Destination Connection Type: ")
                Text(wire.Destination_Conntype)
            
            }
            HStack (){
                Text("Wire Designation Instructions: ")
                //Text(wire.Destination_Instr ?? "")
                
            }
                    }
            if projects[projn].rOfInstall![index].VERIFY_DEST != self.tog3&&self.tog3==false{
                                       TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                                   }
        //.padding()
                    
                    
                    HStack{
                        
                       
                      
                        Toggle(isOn: $tog1) {
                        Text("Installation: ")
                            
                        }
                        //.padding(.trailing, 5.0)
                        .frame(width: 200.0)
                    }.onAppear(){
                        if self.tog1==false{
                            self.tog2=false
                        }
                    }
                    if projects[projn].rOfInstall![index].INSTALL_STATUS != self.tog1&&self.tog1==false{
                                                       TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                                                   }
                  //  if tog1 == true{
                        
                        HStack{
                        
                            
                            Toggle(isOn: $tog2) {
                                    Text("Source Verification: ")
                                    }
                                    .padding(.trailing, 10.0)
                                   // .frame(width: 30.0)
                            .disabled( tog1 == false)
                            
                            Toggle(isOn: $tog3) {
                            Text("Verified Destination: ")
                            }
                            .padding(.trailing, 10.0)
                            .disabled(tog1==false)
                            //.frame(width: 30.0)
                        }.onDisappear(){
                            self.tog4=false
                        }.onAppear(){
                            if self.tog2==false{
                                self.tog4=false
                            }
                        }
                        if projects[projn].rOfInstall![index].VERIFY_SOURCE != self.tog2&&self.tog2==false{
                            TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    //}
                    
                   // if tog1 == true && tog2 == true{
                        HStack{
                                   
                      
                                               Toggle(isOn: $tog4) {
                                               Text("Origin Termination: ")
                                               }
                                               .padding(.trailing, 10.0)
                                               //.frame(width: 60.0)
                                               .disabled(tog2==false)
                                        
                            Toggle(isOn: $tog5) {
                                                                          Text("Destination Termination: ")
                                                                          }
                                                                          .padding(.trailing, 10.0)
                                                                          //.frame(width: 60.0)
                                                                          .disabled(tog3==false)
                            
                                           }
                        
                        .onAppear(){
                                               if self.tog3==false{
                                                   self.tog5=false
                                               }
                                           }
                    HStack{
                                 
                    
                                             Toggle(isOn: $tog6) {
                                             Text("VERIFY Connection ORIGIN : ")
                                             }
                                             .padding(.trailing, 5.0)
                                             //.frame(width: 60.0)
                                             .disabled(tog4==false)
                                      
                          Toggle(isOn: $tog7) {
                                                                        Text("VERIFY Connection DEST: ")
                                                                        }
                                                                        .padding(.trailing, 5.0)
                                                                        //.frame(width: 60.0)
                                                                        .disabled(tog5==false)
                          
                                         }
                     
                      
                    
                       
                }
                
                                                                               Toggle(isOn: $tog8) {
                                                                                                                             HStack{ Text("Tested: ")
                                                                                                                             }
                                                                                                                             .padding(.trailing, 5.0)
                                                                                                                             
                                                                                                                             }.frame(width: 200.0)
                .disabled(tog6==false||tog7==false)
                
                HStack{
                                                  
                                     
                                                              Toggle(isOn: $tog9) {
                                                              Text("Connection Origin: ")
                                                              }
                                                              .padding(.trailing, 5.0)
                                                              //.frame(width: 60.0)
                                                              .disabled(tog8==false)
                                                     
                                           Toggle(isOn: $tog10) {
                                                                                           Text("Connection Destination: ")
                                                                                         }
                                                                                        .padding(.trailing, 5.0)
                                                                                         //.frame(width: 60.0)
                                                                                         .disabled(tog8==false)
                                           
                                                          }
               
                                                                                              Toggle(isOn: $tog11) {
                                                                                                                                             HStack{ Text("Released: ")
                                                                                                                                            }
                                                                                                                                            .padding(.trailing, 5.0)
                                                                                                                                            .frame(width: 100.0)
                                                                                                                                            }.disabled(tog9==false||tog10==false)
                                                                                                .frame(width: 200)
                
               
                   // }
                    /*
                   
                    if tog1&&tog2&&tog3 {
                    HStack{
            Text("Origin Termination: ")
                        if (tog4){
                                                   Text("Termination verified by user \(projects[projn].rOfInstall![index].ORIGIN_TERM_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].ORIGIN_TERM_date ?? "2020-04-06T05:49:07Z")")
                                                           }
                                                       else{
                                                   Text("No").onAppear(){self.tog5=false}
                                                                      }
                        Toggle(isOn: $tog4) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }.onAppear(){
                        if self.tog4==false{
                            self.tog5=false
                        }
                    }
                        
                        if projects[projn].rOfInstall![index].ORIGIN_TERM != self.tog4&&self.tog4==false{
                            TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    if tog1&&tog2&&tog3&&tog4{
                    HStack{
            Text("Destination Termination: ")
                        if (tog5){
                        Text("Termination verified by user \(projects[projn].rOfInstall![index].DEST_TERM_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].DEST_TERM_date ?? "2020-04-06T05:49:07Z")")
                                }
                            else{
                        Text("No").onAppear(){self.tog6=false}
                                           }
                        Toggle(isOn: $tog5) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }.onAppear(){
                        if self.tog5==false{
                            self.tog6=false
                        }
                    }
                        if projects[projn].rOfInstall![index].DEST_TERM != self.tog5&&self.tog5==false{
                            TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                }
                    if tog1&&tog2&&tog3&&tog4&&tog5{
                    HStack{
            Text("Origin Connection Verification: ")
                        if (tog6){
                        Text("Termination verified by user \(projects[projn].rOfInstall![index].VERIFY_CONN_ORIGIN_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].VERIFY_CONN_ORIGIN_date ?? "2020-04-06T05:49:07Z")")
                                }
                            else{
                        Text("No").onAppear(){self.tog7=false}
                                           }
                        Toggle(isOn: $tog6) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }.onAppear(){
                        if self.tog6==false{
                            self.tog7=false
                        }
                    }
                        if projects[projn].rOfInstall![index].VERIFY_CONN_ORIGIN != self.tog6&&self.tog6==false{
                            TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                }
                  if tog1&&tog2&&tog3&&tog4&&tog5&&tog6  {
                    HStack{
            Text("Destination Connection Verification: ")
           if (tog7){
           Text("Termination verified by user \(projects[projn].rOfInstall![index].VERIFY_CONN_DEST_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].VERIFY_CONN_DEST_date ?? "2020-04-06T05:49:07Z")")
                   }
               else{
           Text("No").onAppear(){self.tog8=false}
                              }
                        Toggle(isOn: $tog7) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }.onAppear(){
                        if self.tog7==false{
                            self.tog8=false
                        }
                    }
                    
                    if projects[projn].rOfInstall![index].VERIFY_CONN_DEST != self.tog7&&self.tog7==false{
                        TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                    
                    
                    
                }
            }
            
            Group{
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7 {
                HStack{
                           Text("Cable Testing: ")
                          if (tog8){
                          Text("Tested by user \(projects[projn].rOfInstall![index].TESTED_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].TESTED_date ?? "2020-04-06T05:49:07Z")")
                                  }
                              else{
                          Text("No").onAppear(){self.tog9=false}
                                             }
                                       Toggle(isOn: $tog8) {
                                       /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                                       }
                                       .padding(.trailing, 20.0)
                                       .frame(width: 60.0)
                                   }.onAppear(){
                                       if self.tog8==false{
                                           self.tog9=false
                                       }
                                   }
                
                if projects[projn].rOfInstall![index].TESTED != self.tog8&&self.tog8==false{
                    TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
                */
                
                /*
                if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8{
                HStack{
                           Text("Connection Origin: ")
                          if (tog9){
                          Text("Termination verified by user \(projects[projn].rOfInstall![index].CONN_ORIGIN_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].CONN_ORIGIN_date ?? "2020-04-06T05:49:07Z")")
                                  }
                              else{
                          Text("No").onAppear(){self.tog10=false}
                                             }
                                       Toggle(isOn: $tog9) {
                                       /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                                       }
                                       .padding(.trailing, 20.0)
                                       .frame(width: 60.0)
                                   }.onAppear(){
                                       if self.tog9==false{
                                           self.tog10=false
                                       }
                                   }
                    
                    if projects[projn].rOfInstall![index].CONN_ORIGIN != self.tog9&&self.tog9==false{
                        TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                    }
            }
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9     {
                HStack{
                 Text("Connection Destination: ")
                    if (tog10){
                Text("Termination verified by user \(projects[projn].rOfInstall![index].CONN_DEST_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].CONN_DEST_date ?? "2020-04-06T05:49:07Z")")
                        }
                    else{
                        Text("No").onAppear(){self.tog11=false}
                                   }
                             Toggle(isOn: $tog10) {
                             /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                             }
                             .padding(.trailing, 20.0)
                             .frame(width: 60.0)
                         }.onAppear(){
                             if self.tog10==false{
                                 self.tog11=false
                             }
                         }
                if projects[projn].rOfInstall![index].CONN_DEST != self.tog10&&self.tog10==false{
                    TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
            } */
                /*
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9&&tog10  {
                HStack{
                 Text("Cable Released: ")
                if (tog11){
                Text("Termination verified by user \(projects[projn].rOfInstall![index].RELEASED_user ?? "default_user")\n Verified on \(projects[projn].rOfInstall![index].RELEASED_date ?? "2020-04-06T05:49:07Z")")
                        }
                    else{
                Text("No")
                                   }
                             Toggle(isOn: $tog11) {
                             /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                             }
                             .padding(.trailing, 20.0)
                             .frame(width: 60.0)
                         }
                if projects[projn].rOfInstall![index].RELEASED != self.tog11&&self.tog11==false{
                    TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
                if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9&&tog10&&tog11 {
                Text("Source Comments \(projects[projn].rOfInstall![index].COMMENT_SOURCE ?? "Default Source Comment")")
                Text("Destination Comments \(projects[projn].rOfInstall![index].COMMENT_DEST ?? "Default Destination Comment")")
                    
            }
              */
                
            }
            
                
                               
                           
                           
                           
            
            
            //.padding()
            
 
           // Spacer()
        }.onAppear(){
            print("Wiredetail appear")
            let index = projects[self.projn].rOfInstall!.firstIndex( where: {$0.Cablenum == self.wire.Cablenum}) ?? 0
            //if no cable rci found create falsed out rci and append to rofinstall array, then write to json
            //for saving of rci if no rci exists append, if does exist update value
            //use create initfiles as guide
            //discard changes reassign values from below
           // print(projects[self.projn].rOfInstall![index])
            self.tog1 = projects[self.projn].rOfInstall![index].INSTALL_STATUS
            self.tog2 = projects[self.projn].rOfInstall![index].VERIFY_SOURCE ?? false
            self.tog3 = projects[self.projn].rOfInstall![index].VERIFY_DEST ?? false
            self.tog4 = projects[self.projn].rOfInstall![index].ORIGIN_TERM ?? false
            self.tog5 = projects[self.projn].rOfInstall![index].DEST_TERM ?? false
            self.tog6 = projects[self.projn].rOfInstall![index].VERIFY_CONN_ORIGIN ?? false
            self.tog7 = projects[self.projn].rOfInstall![index].VERIFY_CONN_DEST ?? false
            self.tog8 = projects[self.projn].rOfInstall![index].TESTED ?? false
            self.tog9 = projects[self.projn].rOfInstall![index].CONN_ORIGIN ?? false
            self.tog10 = projects[self.projn].rOfInstall![index].CONN_DEST ?? false
            self.tog11 = projects[self.projn].rOfInstall![index].RELEASED ?? false
            //self.rci = projects[0].rOfInstall![0]
           /*
            self.tog1 = self.rci.INSTALL_STATUS ?? false
           self.tog2 = self.rci.VERIFY_SOURCE ?? false
            self.tog3 = self.rci.VERIFY_DEST ?? false
            self.tog4 = self.rci.ORIGIN_TERM ?? false
            self.tog5 = self.rci.DEST_TERM ?? false
            self.tog6 = self.rci.VERIFY_CONN_ORIGIN ?? false
            self.tog7 = self.rci.VERIFY_CONN_DEST ?? false
            self.tog8 = self.rci.TESTED ?? false
            self.tog9 = self.rci.CONN_ORIGIN ?? false
            self.tog10 = self.rci.CONN_DEST ?? false
            self.tog11 = self.rci.RELEASED ?? false
            //self.updater()
            */
        }.onDisappear(){
            print("Wiredetail disappear")
            /*
            projects[self.projn].rOfInstall!["L2D04268"]?.INSTALL_STATUS = self.tog1
            projects[self.projn].rOfInstall!["L2D04268"]?.VERIFY_SOURCE = self.tog2
            projects[self.projn].rOfInstall!["L2D04268"]?.VERIFY_DEST = self.tog3
            projects[self.projn].rOfInstall!["L2D04268"]?.ORIGIN_TERM = self.tog4
            projects[self.projn].rOfInstall!["L2D04268"]?.DEST_TERM = self.tog5
            projects[self.projn].rOfInstall!["L2D04268"]?.VERIFY_CONN_ORIGIN = self.tog6
            projects[self.projn].rOfInstall!["L2D04268"]?.VERIFY_CONN_DEST = self.tog7
            projects[self.projn].rOfInstall!["L2D04268"]?.TESTED = self.tog8
            projects[self.projn].rOfInstall!["L2D04268"]?.CONN_ORIGIN = self.tog9
            projects[self.projn].rOfInstall!["L2D04268"]?.CONN_DEST = self.tog10
            projects[self.projn].rOfInstall!["L2D04268"]?.RELEASED = self.tog11
            */
           // self.sheetBool.toggle()
            
            }
           
        .navigationBarTitle(Text(wire.Cablenum ))
        
        .navigationBarItems(trailing:
            HStack{
                
                Button(action:{self.infoBool.toggle()}){
                                   Text("Display Info")
                               }.sheet(isPresented: $infoBool){
                                VStack{
                                Button(action:{self.infoBool.toggle()}){
                                    Text("Exit Information View")
                                }
                                    Text("Info display").bold()
                                    Text("Cable Number:  \(self.wire.Cablenum)\nCable Jobnum:  \(self.wire.Jobnum)\nCable Area Code: \(self.wire.Area_Code)\nCable System:  \(self.wire.System)\nCable Function:  \(self.wire.Func)\nCable CableType:  \(self.wire.Cabletype)\nCable Origin Location:  \(self.wire.Origin_Location)\nCable Origin Station:  \(self.wire.Origin_Station)\nCable Origin ConnectionType:  \(self.wire.Origin_Conntype)\nCable Origin Instructions:  \(self.wire.Origin_Instr)\nCable Destination Location:  \(self.wire.Destination_Location)\nCable Destination Station:  \(self.wire.Destination_Station)\nCable Destination ConnectionType:  \(self.wire.Destination_Conntype)\nCable Destination Instructions:  \(self.wire.Destination_Instr ?? "1")\nCable Length:  \(self.wire.Length ?? "unknown")\nCable Routing:  \(self.wire.Routing ?? "Routing information unavailable")\nCable Newrev:  \(self.wire.Newrev ?? "NewRev unlisted")\nCable Project:  \(self.wire.project ?? "No project listed")")
                                }
                               }
                Button(action: {
                                       self.sheetBool.toggle()
                                       
                                   }){
                                       
                                       Text("Save Changes")
                                   } .actionSheet(isPresented: $sheetBool) {
                                    ActionSheet(title: Text("Register Changes"), message: Text("Select Action Choice"), buttons: [.default(Text("Discard Changes")){
                                       self.tog1 = projects[self.projn].rOfInstall![self.index].INSTALL_STATUS
                                       self.tog2 = projects[self.projn].rOfInstall![self.index].VERIFY_SOURCE
                                       self.tog3 = projects[self.projn].rOfInstall![self.index].VERIFY_DEST
                                       self.tog4 = projects[self.projn].rOfInstall![self.index].ORIGIN_TERM
                                       self.tog5 = projects[self.projn].rOfInstall![self.index].DEST_TERM
                                       self.tog6 = projects[self.projn].rOfInstall![self.index].VERIFY_CONN_ORIGIN
                                       self.tog7 = projects[self.projn].rOfInstall![self.index].VERIFY_CONN_DEST
                                       self.tog8 = projects[self.projn].rOfInstall![self.index].TESTED
                                       self.tog9 = projects[self.projn].rOfInstall![self.index].CONN_ORIGIN
                                       self.tog10 =  projects[self.projn].rOfInstall![self.index].CONN_DEST
                                       self.tog11 =  projects[self.projn].rOfInstall![self.index].RELEASED
                                        },.default(Text("Save Changes")){
                                            projects[self.projn].rOfInstall![self.index].INSTALL_STATUS = self.tog1
                                            projects[self.projn].rOfInstall![self.index].VERIFY_SOURCE = self.tog2
                                            projects[self.projn].rOfInstall![self.index].VERIFY_DEST = self.tog3
                                            projects[self.projn].rOfInstall![self.index].ORIGIN_TERM = self.tog4
                                            projects[self.projn].rOfInstall![self.index].DEST_TERM = self.tog5
                                            projects[self.projn].rOfInstall![self.index].VERIFY_CONN_ORIGIN = self.tog6
                                            projects[self.projn].rOfInstall![self.index].VERIFY_CONN_DEST = self.tog7
                                            projects[self.projn].rOfInstall![self.index].TESTED = self.tog8
                                            projects[self.projn].rOfInstall![self.index].CONN_ORIGIN = self.tog9
                                            projects[self.projn].rOfInstall![self.index].CONN_DEST = self.tog10
                                            projects[self.projn].rOfInstall![self.index].RELEASED = self.tog11
                                            print(projects[self.projn].rOfInstall!)
                                            var str = String(projects[self.projn].rOfInstall!.description)
                                           // str = str.flatMap{$0}
                                            
                                            print(str as String)
                                            //str.
                                            
                                            var cleaned = str.replacingOccurrences(of: "Authenticator.rci(" , with: "{")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "(", with: "{")
                                            cleaned = cleaned.replacingOccurrences(of: ")", with: "}")
                                            cleaned = cleaned.replacingOccurrences(of: "Cablenum:", with: "\"Cablenum\":")
                                            cleaned = cleaned.replacingOccurrences(of: "project:", with: "\"project\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_DEST:", with: "\"VERIFY_CONN_DEST\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_DEST_date:", with: "\"VERIFY_CONN_DEST_date\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_DEST_user:", with: "\"VERIFY_CONN_DEST_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_ORIGIN:", with: "\"VERIFY_CONN_ORIGIN\":")
                                             cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_ORIGIN_user:", with: "\"VERIFY_CONN_ORIGIN_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_CONN_ORIGIN_date:", with: "\"VERIFY_CONN_ORIGIN_date\":")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_ORIGIN:", with: "\"CONN_ORIGIN\":")
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_ORIGIN_user:", with: "\"CONN_ORIGIN_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_ORIGIN_date:", with: "\"CONN_ORIGIN_date\":")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "INSTALL_STATUS:", with: "\"INSTALL_STATUS\":")
                                            cleaned = cleaned.replacingOccurrences(of: "INSTALL_STATUS_user:", with: "\"INSTALL_STATUS_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "INSTALL_STATUS_date:", with: "\"INSTALL_STATUS_date\":")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_SOURCE:", with: "\"VERIFY_SOURCE\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_SOURCE_user:", with: "\"VERIFY_SOURCE_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_SOURCE_date:", with: "\"VERIFY_SOURCE_date\":")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_DEST:", with: "\"VERIFY_DEST\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_DEST_user:", with: "\"VERIFY_DEST_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "VERIFY_DEST_date:", with: "\"VERIFY_DEST_date\":")

                                            cleaned = cleaned.replacingOccurrences(of: "ORIGIN_TERM:", with: "\"ORIGIN_TERM\":")
                                            cleaned = cleaned.replacingOccurrences(of: "ORIGIN_TERM_user:", with: "\"ORIGIN_TERM_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "ORIGIN_TERM_date:", with: "\"ORIGIN_TERM_date\":")
                                            
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "DEST_TERM:", with: "\"DEST_TERM\":")
                                             cleaned = cleaned.replacingOccurrences(of: "DEST_TERM_user:", with: "\"DEST_TERM_user\":")
                                             cleaned = cleaned.replacingOccurrences(of: "DEST_TERM_date:", with: "\"DEST_TERM_date\":")
                                            
                                            
                                            
                                            
                                            
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_DEST:", with: "\"CONN_DEST\":")
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_DEST_user:", with: "\"CONN_DEST_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "CONN_DEST_date:", with: "\"CONN_DEST_date\":")
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "TESTED:", with: "\"TESTED\":")
                                            cleaned = cleaned.replacingOccurrences(of: "TESTED_user:", with: "\"TESTED_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "TESTED_date:", with: "\"TESTED_date\":")
                                            
                                            
                                            
                                            
                                            
                                            
                                            cleaned = cleaned.replacingOccurrences(of: "RELEASED:", with: "\"RELEASED\":")
                                            cleaned = cleaned.replacingOccurrences(of: "RELEASED_user:", with: "\"RELEASED_user\":")
                                            cleaned = cleaned.replacingOccurrences(of: "RELEASED_date:", with: "\"RELEASED_date\":")
                                            cleaned = cleaned.replacingOccurrences(of: "COMMENT_SOURCE:", with: "\"COMMENT_SOURCE\":")
cleaned = cleaned.replacingOccurrences(of: "COMMENT_DEST:", with: "\"COMMENT_DEST\":")
                                            cleaned = cleaned.replacingOccurrences(of: "Optional{", with: "")
                                            cleaned = cleaned.replacingOccurrences(of: "}, \"", with: ", \"")
                                            cleaned = cleaned.replacingOccurrences(of: "}}", with: "}")
                                            cleaned = cleaned.replacingOccurrences(of: "nil", with: "null")
                                           //var output =  cleaned?
                                            print(cleaned)
                                            /*
                                            if let stra = projects[self.projn].rOfInstall{
                                            print(stra)
                                            } */
                                            print("Save Changes")
                                            let today = Date()
                                            
                                                   let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: today)!
                                                              let formatter = DateFormatter()
                                                              formatter.dateFormat = "yyyy-MM-d'T'HH:mm:ss'Z'"
                                                              let dateOut = formatter.string(from: modifiedDate)
                                            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(projects[self.projn].area_code+file1)
                                            do {
                                                              try cleaned.write(to: url, atomically: true, encoding: .utf8)
                                                          } catch {
                                                              print(error.localizedDescription)
                                                          }
                                            var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"INSTALL_STATUS",value:self.tog1,user:userID, date:dateOut)
                                            changes.append(chang)
                                            
                                           // print(changes.description)
                                            
                                            var outchange = changes.description
                                            
                                            outchange = outchange.replacingOccurrences(of: "Authenticator.Changes", with: "")
                                           // print(outchange)
                                            uploader=outchange
                                        },.cancel()])
                                          }
                
                
                
            }
        
        )
    }
    //}
 
}
/*
struct WireDetail_Previews: PreviewProvider {
    static var previews: some View {
        WireDetail(wire:wireData[0])
    }
}
*/

 
 
 
 
 
 
 
 
 
 
 
