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
    var rci: rci
   // @State var cablenumber : String
    
         @State var tog1 : Bool = false
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
    
    var changedCount: Int = 0
    var changed : Bool = false
    var saved : Bool = false
    
   
    
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
                    Text("Area Code: \(wire.Area_Code)")
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
            
        //.padding()
                    
                    HStack{
                        
            Text("Installation: ")
                        
                        if (tog1) {
                            Text("Installed by user \(rci.INSTALL_STATUS_user ?? "default_user")\n Installed on \(rci.INSTALL_STATUS_date ?? "2020-04-06T05:49:07Z")")
                            
                        }
                        else{
                            Text("No")
                            //tog2 = false
                            
                        }
                        Toggle(isOn: $tog1) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                            
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }.onAppear(){
                        if self.tog1==false{
                            self.tog2=false
                        }
                    }
                    if tog1 == true{
                        
                        HStack{
                        Text("Source Verification: ")
                                    
                                    if (tog2){
                                        Text("Verified by user \(rci.VERIFY_SOURCE_user ?? "default_user")\n Verified on \(rci.VERIFY_SOURCE_date ?? "2020-04-06T05:49:07Z")")
                                        
                                                }
                                            else{
                                        Text("No")
                                                           }
                                    Toggle(isOn: $tog2) {
                                    /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                                    }
                                    .padding(.trailing, 20.0)
                                    .frame(width: 60.0)
                        }.onDisappear(){
                            self.tog3=false
                        }.onAppear(){
                            if self.tog2==false{
                                self.tog3=false
                            }
                        }
                        
                    }
                    
                    if tog1 == true && tog2 == true{
                        HStack{
                                   Text("Verified Destination: ")
                                               if (tog3){
                                               Text("Verified by user \(rci.VERIFY_DEST_user ?? "default_user")\n Verified on \(rci.VERIFY_DEST_date ?? "2020-04-06T05:49:07Z")")
                                                                                  }
                                                                              else{
                                                                          Text("No")
                                                                                             }
                                               Toggle(isOn: $tog3) {
                                               /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                                               }
                                               .padding(.trailing, 20.0)
                                               .frame(width: 60.0)
                                           }.onAppear(){
                                               if self.tog3==false{
                                                   self.tog4=false
                                               }
                                           }
                        
                    }
                   
                    if tog1&&tog2&&tog3 {
                    HStack{
            Text("Origin Termination: ")
                        if (tog4){
                                                   Text("Termination verified by user \(rci.ORIGIN_TERM_user ?? "default_user")\n Verified on \(rci.ORIGIN_TERM_date ?? "2020-04-06T05:49:07Z")")
                                                           }
                                                       else{
                                                   Text("No")
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
                    }
                    if tog1&&tog2&&tog3&&tog4{
                    HStack{
            Text("Destination Termination: ")
                        if (tog5){
                        Text("Termination verified by user \(rci.DEST_TERM_user ?? "default_user")\n Verified on \(rci.DEST_TERM_date ?? "2020-04-06T05:49:07Z")")
                                }
                            else{
                        Text("No")
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
                }
                    if tog1&&tog2&&tog3&&tog4&&tog5{
                    HStack{
            Text("Origin Connection Verification: ")
                        if (tog6){
                        Text("Termination verified by user \(rci.VERIFY_CONN_ORIGIN_user ?? "default_user")\n Verified on \(rci.VERIFY_CONN_ORIGIN_date ?? "2020-04-06T05:49:07Z")")
                                }
                            else{
                        Text("No")
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
                }
                  if tog1&&tog2&&tog3&&tog4&&tog5&&tog6  {
                    HStack{
            Text("Destination Connection Verification: ")
           if (tog7){
           Text("Termination verified by user \(rci.VERIFY_CONN_DEST_user ?? "default_user")\n Verified on \(rci.VERIFY_CONN_DEST_date ?? "2020-04-06T05:49:07Z")")
                   }
               else{
           Text("No")
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
                }
                    
                    
                    
                }
            }
            
            Group{
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7 {
                HStack{
                           Text("Cable Testing: ")
                          if (tog8){
                          Text("Tested by user \(rci.TESTED_user ?? "default_user")\n Verified on \(rci.TESTED_date ?? "2020-04-06T05:49:07Z")")
                                  }
                              else{
                          Text("No")
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
            }
                if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8{
                HStack{
                           Text("Connection Origin: ")
                          if (tog9){
                          Text("Termination verified by user \(rci.CONN_ORIGIN_user ?? "default_user")\n Verified on \(rci.CONN_ORIGIN_date ?? "2020-04-06T05:49:07Z")")
                                  }
                              else{
                          Text("No")
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
            }
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9     {
                HStack{
                 Text("Connection Destination: ")
                    if (tog10){
                Text("Termination verified by user \(rci.CONN_DEST_user ?? "default_user")\n Verified on \(rci.CONN_DEST_date ?? "2020-04-06T05:49:07Z")")
                        }
                    else{
                Text("No")
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
            }
               if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9&&tog10  {
                HStack{
                 Text("Cable Released: ")
                if (tog11){
                Text("Termination verified by user \(rci.RELEASED_user ?? "default_user")\n Verified on \(rci.RELEASED_date ?? "2020-04-06T05:49:07Z")")
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
            }
                if tog1&&tog2&&tog3&&tog4&&tog5&&tog6&&tog7&&tog8&&tog9&&tog10&&tog11 {
                Text("Source Comments \(rci.COMMENT_SOURCE ?? "Default Source Comment")")
                Text("Destination Comments \(rci.COMMENT_DEST ?? "Default Destination Comment")")
                    
            }
                
                
            }
            
                
                               
                           
                           
                           
            
            
            //.padding()
            
 
           // Spacer()
        }.onAppear(){
            print("Wiredetail appear")
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
            
        }.onDisappear(){
            print("Wiredetail disappear")
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
            
            }
           
        .navigationBarTitle(Text(wire.Cablenum ))
        
        
    }
    //}
    func updater(){
           if tog1 != true{
               tog2 = false
           }
           if tog2 != true{
                      tog3 = false
                  }
           if tog3 != true{
                      tog4 = false
                  }
           if tog4 != true{
                      tog5 = false
                  }
           if tog5 != true{
                      tog6 = false
                  }
           if tog6 != true{
                      tog7 = false
                  }
           if tog7 != true{
                      tog8 = false
                  }
           if tog8 != true{
                      tog9 = false
                  }
           if tog9 != true{
                      tog10 = false
                  }
           if tog10 != true{
                      tog11 = false
                  }
           
       }
}
/*
struct WireDetail_Previews: PreviewProvider {
    static var previews: some View {
        WireDetail(wire:wireData[0])
    }
}
*/
