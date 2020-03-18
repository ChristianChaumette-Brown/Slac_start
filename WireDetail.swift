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
    
    var body: some View {
        VStack{
            
            VStack(alignment: HorizontalAlignment.leading) {
                
                //care Vstack can only handle 10 children
               // VStack{
                   // Text(wire.name)
                //}
                Group{
                Text(wire.name)
                .font(.title)

                HStack(alignment: .top) {
                    Text(wire.park)
                        .font(.subheadline)
                    Spacer()
                    Text("Wire Group: ")
                    Text(wire.state)
                        .font(.subheadline)
                    
                }
                Group{
            HStack{
                Text("Wire ID: ")
                
                 Text(String(wire.ids)).font(.title)
                }
           
           
            
            HStack{
                Text("Wire Status: ")
            Text(wire.city)
            
            }
            HStack (){
                Text("Wire Designation: ")
                Text(wire.park)
                
            }
                    }
            
        //.padding()
                    
                    HStack{
                        
            Text("Installation Status: ")
                        
                        if wire.isInstalled{
                            Text("Yes")
                        }
                        else{
                            Text("No")
                        }
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                                            }
                    
                    HStack{
            Text("Verified Source: ")
                        
                        if wire.isVSource{
                            Text("Yes")
                                    }
                                else{
                            Text("No")
                                               }
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                                            }
                    
                    HStack{
            Text("Verified Destination: ")
                        if wire.isVDest{
                                                   Text("Yes")
                                                           }
                                                       else{
                                                   Text("No")
                                                                      }
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }
                    HStack{
            Text("Terminating Source: ")
                        if wire.isTerminated{
                                                   Text("Yes")
                                                           }
                                                       else{
                                                   Text("No")
                                                                      }
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }
                    HStack{
            Text("Connection Type: ")
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }
                    HStack{
            Text("Connector: ")
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }
                    HStack{
            Text("Wire Type: ")
           //
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                        }
                        .padding(.trailing, 20.0)
                        .frame(width: 60.0)
                    }
                }
            }
            
               
            
                
                               
                           
                           
                           
            
            
            .padding()
            
 
           // Spacer()
        }.onAppear(){
            print("Wiredetail appear")
            RegisterViewController().view.isHidden = true
        }.onDisappear(){
            print("Wiredetail disappear")
        }
           
        .navigationBarTitle(Text(wire.name), displayMode: .inline)
    }

}
struct WireDetail_Previews: PreviewProvider {
    static var previews: some View {
        WireDetail(wire:wireData[0])
    }
}
