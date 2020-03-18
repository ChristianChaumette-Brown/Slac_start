//
//  Wire.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct Wire: Hashable, Codable, Identifiable  {
    
     //Identifiable
var id: Int
var ids: Int
    //var wid: String = String(ids)
    var name: String
    var category: String
fileprivate var imageName: String

    var isInstalled:Bool
    var isVSource: Bool
    var isVDest: Bool
    var isTerminated:Bool
    var park:String
    var city:String
    var state:String
 
    //test datafields above
    //actual data fields below
    /*
    var id:String
    var Area_code: String
    var Jobnum: String
    var Cablenum: String
    var system: String
    var Func: String
    var Cabletype: String
    var Origin_location: String
    var Origin_station: String
    var Origin_Conntype: String
    var Origin_Instr: String
    var Destination_location: String
    var Destination_station: String
    var Destination_Conntype: String
    var Destination_Instr: String
    var Length: String
    var Routing: String
    */
    
    mutating func lowerme(){
        name=name.lowercased()
    }
 
}
    

extension Wire {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


