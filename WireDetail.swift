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
                Text(wire.Cablenum)
                .font(.title)
                    

                HStack(alignment: .top) {
                    Text(wire.Area_Code)
                        .font(.subheadline)
                    Spacer()
                    Text("Wire Group: ")
                    Text(wire.Jobnum)
                        .font(.subheadline)
                    
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
                Text(wire.Destination_Instr)
                
            }
                    }
            
        //.padding()
                    
                    HStack{
                        
            Text("Origin Instruction: ")
                        
                        if wire.Origin_Instr==""{
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
            Text("Destination Instruction: ")
                        
                        if wire.Destination_Instr==""{
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
                        if wire.Destination_Station==""{
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
                    if wire.Newrev != "1" {
                    HStack{
            Text("Terminating Source: ")
                        if wire.Newrev=="1"{
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
           
        .navigationBarTitle(Text(wire.Cablenum), displayMode: .inline)
    }

}
struct WireDetail_Previews: PreviewProvider {
    static var previews: some View {
        WireDetail(wire:wireData[0])
    }
}
