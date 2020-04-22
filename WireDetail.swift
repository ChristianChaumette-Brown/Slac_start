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
   @Environment(\.presentationMode) var presentationMode
    
    @State var visable : Bool = true
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
    @State var changed1 = false
    @State var changed2 = false
    @State var changed3 = false
    @State var changed4 = false
    @State var changed5 = false
    @State var changed6 = false
    @State var changed7 = false
    @State var changed8 = false
    @State var changed9 = false
    @State var changed10 = false
    @State var changed11 = false
    
    @State var freeChange = false
    
    var changedCount: Int = 0
    @ State var changed : Bool = false
    var saved : Bool = false
    var index = -1
    var setColor = Color(UIColor.gray)
    
    @State var toggleColor1 = Color(UIColor.orange)
    @State var toggleColor2 = Color(UIColor.orange)
     @State var toggleColor3 = Color(UIColor.orange)
    @State var toggleColor4 = Color(UIColor.orange)
    @State var toggleColor5 = Color(UIColor.orange)
    @State var toggleColor6 = Color(UIColor.orange)
    @State var toggleColor7 = Color(UIColor.orange)
   @State  var toggleColor8 = Color(UIColor.orange)
   @State var toggleColor9 = Color(UIColor.orange)
   @State var toggleColor10 = Color(UIColor.orange)
   @State var toggleColor11 = Color(UIColor.orange)
    
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
            
            let rc = rci (Cablenum:wire.Cablenum,project:projects[projn].area_code,INSTALL_STATUS:nil,INSTALL_STATUS_user:nil,INSTALL_STATUS_date:nil,VERIFY_SOURCE:nil,VERIFY_SOURCE_user:nil,VERIFY_SOURCE_date:nil,VERIFY_DEST:nil,VERIFY_DEST_user:nil,VERIFY_DEST_date:nil,ORIGIN_TERM:nil,ORIGIN_TERM_user:nil,ORIGIN_TERM_date:nil,DEST_TERM:nil,DEST_TERM_user:nil,DEST_TERM_date:nil,VERIFY_CONN_ORIGIN:nil,VERIFY_CONN_ORIGIN_user: nil,VERIFY_CONN_ORIGIN_date:nil, VERIFY_CONN_DEST:nil,VERIFY_CONN_DEST_user: nil,VERIFY_CONN_DEST_date:nil,TESTED:nil,TESTED_user: nil,TESTED_date:nil,CONN_ORIGIN:nil,CONN_ORIGIN_user: nil,CONN_ORIGIN_date:nil,CONN_DEST:nil,CONN_DEST_user: nil,CONN_DEST_date:nil, RELEASED:nil,RELEASED_user: nil,RELEASED_date: nil, COMMENT_SOURCE: "Default Source Comment", COMMENT_DEST: "Default Destination Comment"  )
            
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
                            .font(.subheadline).padding(.leading,30)
                        //Spacer()
                        Text("Wire Jobnum: ")
                        Text(wire.Jobnum)
                        // .font(.subheadline)
                        
                    }
                    Group{
                        HStack{
                            
                            Text("Wire CableType: ").padding(.leading,30)
                            
                            Text(String(wire.Cabletype)).font(.title)
                            
                            Button(action:{self.freeChange.toggle()}){Text("Free Change")}
                            
                            
                        }
                        
                        
                        
                        HStack{
                            Text("Destination Connection Type: ").padding(.leading,30)
                            Text(wire.Destination_Conntype)
                            
                        }
                        HStack (){
                            Text("Wire Designation Instructions: ").padding(.leading,30)
                            //Text(wire.Destination_Instr ?? "")
                            
                        }
                    }
                    if changed == true && ((self.tog1==false&&self.changed1==true)||(self.tog2==false&&self.changed2==true)||(self.tog3==false&&self.changed3==true)||(self.tog4==false&&self.changed4==true)||(self.tog5==false&&self.changed5==true)||(self.tog6==false&&self.changed6==true)||(self.tog7==false&&self.changed7==true)||(self.tog8==false&&self.changed8==true)||(self.tog9==false&&self.changed9==true)||(self.tog10==false&&self.changed10==true)||(self.tog11==false&&self.changed11==true)){
                        TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    //.padding()
                    
                    
                    HStack{
                        
                        
                        
                        Toggle(isOn: $tog1) {
                            Text("Installation: ")
                            
                        }
                            //.padding(.trailing, 5.0)
                            .frame(width: 200.0)
                        .toggleStyle(
                            ColoredToggleStyle(label: "Installation: ",
                                           onColor: .green,
                                           offColor: setColor,
                                           thumbColor: toggleColor1))
                            
                    }.onAppear(){
                        if self.tog1==false{
                            self.tog2=false
                        }
                    }
                    /*
                    if projects[projn].rOfInstall![index].INSTALL_STATUS != self.tog1&&self.tog1==false{
                        TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                    }*/
                    //  if tog1 == true{
                    
                    HStack{
                        
                        
                        Toggle(isOn: $tog2) {
                            Text("Source Verification: ")
                        }
                        .padding(.trailing, 10.0)
                            .frame(width: 200.0)
                            .toggleStyle(
                            ColoredToggleStyle(label: "Source Verification: ",
                                           onColor: .green,
                                           offColor: setColor,
                                           thumbColor: toggleColor2))
                            .disabled( tog1 == false&&freeChange==false )
                        
                        Toggle(isOn: $tog3) {
                            Text("Verified Destination: ")
                        }
                            .toggleStyle(
                            ColoredToggleStyle(label: "Verified Destination: ",
                                           onColor: .green,
                                           offColor: setColor,
                                           thumbColor: toggleColor3))
                        .padding(.trailing, 10.0)
                        .disabled(tog1==false&&freeChange==false)
                        
                        .frame(width: 200.0)
                    }.onDisappear(){
                        self.tog4=false
                    }.onAppear(){
                        if self.tog2==false{
                            self.tog4=false
                        }
                    }
                    /*
                    if projects[projn].rOfInstall![index].VERIFY_SOURCE != self.tog2&&self.tog2==false{
                        TextField("Enter reason for Status",text: self.$installField).textFieldStyle(RoundedBorderTextFieldStyle())
                    } */
                    //}
                    
                    // if tog1 == true && tog2 == true{
                    HStack{
                        
                        
                        Toggle(isOn: $tog4) {
                            Text("Origin Termination: ")
                        }
                       // .padding(.trailing, 10.0)
                            .frame(width: 200.0)
                            .toggleStyle(
                                ColoredToggleStyle(label: "Origin Termination: ",
                                               onColor: .green,
                                               offColor: setColor,
                                               thumbColor: toggleColor4))
                            .padding(.trailing, 10.0)
                            
                            
                            .disabled(tog2==false&&freeChange==false)
                        
                        Toggle(isOn: $tog5) {
                            Text("Destination Termination: ")
                        }
                        .padding(.trailing, 10.0)
                            .frame(width: 200.0)
                            .toggleStyle(
                                                           ColoredToggleStyle(label: "Destination Termination: ",
                                                                          onColor: .green,
                                                                          offColor: setColor,
                                                                          thumbColor: toggleColor5))
                            .disabled(tog3==false&&freeChange==false)
                        
                    }
                        
                    .onAppear(){
                        if self.tog3==false{
                            self.tog5=false
                        }
                    }
                    HStack{
                        
                        
                        Toggle(isOn: $tog6) {
                            Text("VERIFY Connection ORIGIN: ")
                        }
                        .padding(.trailing, 5.0)
                            .frame(width: 200.0)
                            .toggleStyle(
                            ColoredToggleStyle(label: "VERIFY Connection ORIGIN: ",
                                           onColor: .green,
                                           offColor: setColor,
                                           thumbColor: toggleColor6))
                            .disabled(tog4==false&&freeChange==false)
                        
                        Toggle(isOn: $tog7) {
                            Text("VERIFY Connection DEST: ")
                        }
                        .padding(.trailing, 5.0)
                            .frame(width: 200.0)
                            .toggleStyle(
                            ColoredToggleStyle(label: "VERIFY Connection DEST: ",
                                           onColor: .green,
                                           offColor: setColor,
                                           thumbColor: toggleColor7))
                            .disabled(tog5==false&&freeChange==false)
                        
                    }
                    
                    
                    
                    
                }
                
                Toggle(isOn: $tog8) {
                    HStack{ Text("Tested: ")
                    }
                   // .padding(.trailing, 5.0)
                    
                    
                }.frame(width: 200.0)
                    .disabled((tog6==false||tog7==false)&&freeChange==false)
                .toggleStyle(
                ColoredToggleStyle(label: "Tested: ",
                               onColor: .green,
                               offColor: setColor,
                               thumbColor: toggleColor8))
                
                HStack{
                    
                    
                    Toggle(isOn: $tog9) {
                        Text("Connection Origin: ")
                    }
                    .padding(.trailing, 5.0)
                        .frame(width: 200.0)
                        .toggleStyle(
                        ColoredToggleStyle(label: "Connection Origin: ",
                                       onColor: .green,
                                       offColor: setColor,
                                       thumbColor: toggleColor9))
                        .disabled(tog8==false&&freeChange==false)
                    
                    Toggle(isOn: $tog10) {
                        Text("Connection Destination: ")
                    }
                    .padding(.trailing, 5.0)
                        .toggleStyle(
                        ColoredToggleStyle(label: "Connection Destination: ",
                                       onColor: .green,
                                       offColor: setColor,
                                       thumbColor: toggleColor10))
                        .frame(width: 200.0)
                        .disabled(tog8==false&&freeChange==false)
                    
                }
                
                Toggle(isOn: $tog11) {
                    HStack{ Text("Released: ")
                    }
                   // .padding(.trailing, 5.0)
                    .frame(width: 200.0)
                    
                }.toggleStyle(
                ColoredToggleStyle(label: "Released: ",
                               onColor: .green,
                               offColor: setColor,
                               thumbColor: toggleColor11))
                .disabled((tog9==false||tog10==false)&&freeChange==false)
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
            
            self.tog1 = projects[self.projn].rOfInstall![index].INSTALL_STATUS ?? false
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
        
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: self.visable){timer in
                if self.freeChange == false {
                if self.tog1 == false{
                    self.tog2=false
                    self.tog3=false
                }
                if self.tog2 == false{self.tog4=false}
                if self.tog4 == false{self.tog6=false}
                if self.tog3 == false{self.tog5=false}
                if self.tog5 == false{self.tog7=false}
                if (self.tog6) == false{self.tog8=false}
                if (self.tog7) == false{self.tog8=false}
                if self.tog8 == false{
                    self.tog9=false
                    self.tog10=false
                }
                    if self.tog9==false||self.tog10==false{self.tog11=false}
            }
                
               // if
                

                
                
                
                if self.tog1 != projects[self.projn].rOfInstall?[self.index].INSTALL_STATUS ?? false {self.changed1=true;self.changed=true}
                if self.tog2 != projects[self.projn].rOfInstall?[self.index].VERIFY_SOURCE ?? false {self.changed2=true;self.changed=true}
                if  self.tog3 != projects[self.projn].rOfInstall?[self.index].VERIFY_DEST ?? false {self.changed3=true;self.changed=true}
                if self.tog4 != projects[self.projn].rOfInstall?[self.index].ORIGIN_TERM ?? false {self.changed4=true;self.changed=true}
                if self.tog5 != projects[self.projn].rOfInstall?[self.index].DEST_TERM ?? false {self.changed5=true;self.changed=true}
                if self.tog6 != projects[self.projn].rOfInstall?[self.index].VERIFY_CONN_ORIGIN ?? false {self.changed6=true;self.changed=true}
                if self.tog7 != projects[self.projn].rOfInstall?[self.index].VERIFY_CONN_DEST ?? false {self.changed7=true;self.changed=true}
                if self.tog8 != projects[self.projn].rOfInstall?[self.index].TESTED ?? false {self.changed8=true;self.changed=true}
                if self.tog9 != projects[self.projn].rOfInstall?[self.index].CONN_ORIGIN ?? false {self.changed9=true;self.changed=true}
                if self.tog10 !=  projects[self.projn].rOfInstall?[self.index].CONN_DEST ?? false {self.changed10=true;self.changed=true}
                if self.tog11 !=  projects[self.projn].rOfInstall?[self.index].RELEASED ?? false {self.changed11=true;self.changed=true}
                
                if (projects[self.projn].rOfInstall![index].INSTALL_STATUS != nil || self.changed1==true)&&self.tog1==true{self.toggleColor1 = Color(UIColor.green)}
                if  (projects[self.projn].rOfInstall![index].VERIFY_SOURCE != nil || self.changed2==true)&&self.tog2==true{self.toggleColor2 = Color(UIColor.green)}
                if   (projects[self.projn].rOfInstall![index].VERIFY_DEST != nil || self.changed3==true)&&self.tog3==true{self.toggleColor3 = Color(UIColor.green)}
                if   (projects[self.projn].rOfInstall![index].ORIGIN_TERM != nil || self.changed4==true)&&self.tog4==true{self.toggleColor4 = Color(UIColor.green)}
                if (projects[self.projn].rOfInstall![index].DEST_TERM != nil || self.changed5==true)&&self.tog5==true{self.toggleColor5 = Color(UIColor.green)}
                if  (projects[self.projn].rOfInstall![index].VERIFY_CONN_ORIGIN != nil || self.changed6==true)&&self.tog6==true{self.toggleColor6 = Color(UIColor.green)}
                if  (projects[self.projn].rOfInstall![index].VERIFY_CONN_DEST != nil || self.changed7==true)&&self.tog7==true{self.toggleColor7 = Color(UIColor.green)}
                if  (projects[self.projn].rOfInstall![index].TESTED != nil || self.changed8==true)&&self.tog8==true{self.toggleColor8 = Color(UIColor.green)}
                if  (projects[self.projn].rOfInstall![index].CONN_ORIGIN != nil || self.changed9==true)&&self.tog9==true{self.toggleColor9 = Color(UIColor.green)}
                if   (projects[self.projn].rOfInstall![index].CONN_DEST != nil || self.changed10==true)&&self.tog10{self.toggleColor10 = Color(UIColor.green)}
                if   (projects[self.projn].rOfInstall![index].RELEASED != nil || self.changed11==true)&&self.tog11{self.toggleColor11 = Color(UIColor.green)}
                
                if (projects[self.projn].rOfInstall![index].INSTALL_STATUS != nil || self.changed1==true)&&self.tog1==false{self.toggleColor1 = Color(UIColor.red)}
                if  (projects[self.projn].rOfInstall![index].VERIFY_SOURCE != nil || self.changed2==true)&&self.tog2==false{self.toggleColor2 = Color(UIColor.red)}
                               if   (projects[self.projn].rOfInstall![index].VERIFY_DEST != nil || self.changed3==true)&&self.tog3==false{self.toggleColor3 = Color(UIColor.red)}
                               if   (projects[self.projn].rOfInstall![index].ORIGIN_TERM != nil || self.changed4==true)&&self.tog4==false{self.toggleColor4 = Color(UIColor.red)}
                               if (projects[self.projn].rOfInstall![index].DEST_TERM != nil || self.changed5==true)&&self.tog5==false{self.toggleColor5 = Color(UIColor.red)}
                               if ( projects[self.projn].rOfInstall![index].VERIFY_CONN_ORIGIN != nil || self.changed6==true)&&self.tog6==false{self.toggleColor6 = Color(UIColor.red)}
                                if  (projects[self.projn].rOfInstall![index].VERIFY_CONN_DEST != nil || self.changed7==true)&&self.tog7==false{self.toggleColor7 = Color(UIColor.red)}
                                if ( projects[self.projn].rOfInstall![index].TESTED != nil || self.changed8==true)&&self.tog8==false{self.toggleColor8 = Color(UIColor.red)}
                                if  (projects[self.projn].rOfInstall![index].CONN_ORIGIN != nil || self.changed9==true)&&self.tog9==false{self.toggleColor9 = Color(UIColor.red)}
                               if   (projects[self.projn].rOfInstall![index].CONN_DEST != nil || self.changed10==true)&&self.tog10==false{self.toggleColor10 = Color(UIColor.red)}
                               if   (projects[self.projn].rOfInstall![index].RELEASED != nil || self.changed11==true)&&self.tog11==false{self.toggleColor11 = Color(UIColor.red)}
            }
        }.onDisappear(){
            print("Wiredetail disappear")
            self.presentationMode.wrappedValue.dismiss()
            self.deleteDisabled(false)
            self.visable=false
            //self.
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
            //.scaledToFit()
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
                        self.tog1 = projects[self.projn].rOfInstall![self.index].INSTALL_STATUS ?? false
                        self.tog2 = projects[self.projn].rOfInstall![self.index].VERIFY_SOURCE ?? false
                        self.tog3 = projects[self.projn].rOfInstall![self.index].VERIFY_DEST ?? false
                        self.tog4 = projects[self.projn].rOfInstall![self.index].ORIGIN_TERM ?? false
                        self.tog5 = projects[self.projn].rOfInstall![self.index].DEST_TERM ?? false
                        self.tog6 = projects[self.projn].rOfInstall![self.index].VERIFY_CONN_ORIGIN ?? false
                        self.tog7 = projects[self.projn].rOfInstall![self.index].VERIFY_CONN_DEST ?? false
                        self.tog8 = projects[self.projn].rOfInstall![self.index].TESTED ?? false
                        self.tog9 = projects[self.projn].rOfInstall![self.index].CONN_ORIGIN ?? false
                        self.tog10 =  projects[self.projn].rOfInstall![self.index].CONN_DEST ?? false
                        self.tog11 =  projects[self.projn].rOfInstall![self.index].RELEASED ?? false
                        self.changed=false
                        self.changed1=false
                        self.changed2=false
                        self.changed3=false
                        self.changed4=false
                        self.changed5=false
                        self.changed6=false
                        self.changed7=false
                        self.changed8=false
                        self.changed9=false
                        self.changed10=false
                        self.changed11=false
                        self.installField=""
                        },.default(Text("Save Changes")){
                            if self.changed1==true{ projects[self.projn].rOfInstall![self.index].INSTALL_STATUS = self.tog1}
                            if self.changed2==true{ projects[self.projn].rOfInstall![self.index].VERIFY_SOURCE = self.tog2}
                                if self.changed3==true{ projects[self.projn].rOfInstall![self.index].VERIFY_DEST = self.tog3}
                                if self.changed4==true{ projects[self.projn].rOfInstall![self.index].ORIGIN_TERM = self.tog4}
                                if self.changed5==true{ projects[self.projn].rOfInstall![self.index].DEST_TERM = self.tog5}
                                if self.changed6==true{ projects[self.projn].rOfInstall![self.index].VERIFY_CONN_ORIGIN = self.tog6}
                                if self.changed7==true{ projects[self.projn].rOfInstall![self.index].VERIFY_CONN_DEST = self.tog7}
                                if self.changed8==true{ projects[self.projn].rOfInstall![self.index].TESTED = self.tog8}
                                if self.changed9==true{ projects[self.projn].rOfInstall![self.index].CONN_ORIGIN = self.tog9}
                                if self.changed10==true{ projects[self.projn].rOfInstall![self.index].CONN_DEST = self.tog10}
                                if self.changed11==true{ projects[self.projn].rOfInstall![self.index].RELEASED = self.tog11}
                            if self.installField != ""{projects[self.projn].rOfInstall![self.index].COMMENT_DEST = self.installField}
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
                            
                            if self.changed1 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"INSTALL_STATUS",value:self.tog1,user:userID, date:dateOut)
                                //add to all key:"COMMENT_DEST": projects[self.projn].rOfInstall![self.index].COMMENT_DEST
                                changes.append(chang)
                            }
                            if self.changed2 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"VERIFY_SOURCE",value:self.tog2,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed3 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"VERIFY_DEST",value:self.tog3,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed4 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"ORIGIN_TERM",value:self.tog4,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed5 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"DEST_TERM",value:self.tog5,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed6 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"VERIFY_CONN_ORIGIN",value:self.tog6,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed7 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"VERIFY_CONN_DEST",value:self.tog7,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed8 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"TESTED",value:self.tog8,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed9 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"CONN_ORIGIN",value:self.tog9,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed10 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"CONN_DEST",value:self.tog10,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            if self.changed11 == true{var chang = Changes(Cablenum:self.wire.Cablenum,project:self.wire.Area_Code,key:"RELEASED",value:self.tog11,user:userID, date:dateOut)
                                changes.append(chang)
                            }
                            
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






struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label).font(.body)
           // Spacer()
           
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}





