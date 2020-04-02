//
//  Wire.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct Wire: Hashable, Codable, Identifiable  {
    /*
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
 */
    //test datafields above
    //actual data fields below
    
    var id=UUID()
    var AreaCode: String
    var Jobnum: String
    var Cablenum: String
    var System: String
    var Func: String
    var Cabletype: String
    var OriginLocation: String
    var OriginStation: String
    var OriginConntype: String
    var OriginInstr: String
    var DestinationLocation: String
    var DestinationStation: String
    var DestinationConntype: String
    var DestinationInstr: String
    var Length: String
    var Routing: String
    var Newrev: String
    
    enum CodingKeys: String, CodingKey{
        case AreaCode, Jobnum, Cablenum, System, Func, Cabletype, OriginLocation, OriginStation, OriginConntype, OriginInstr, DestinationLocation, DestinationStation, DestinationConntype, DestinationInstr, Length, Routing, Newrev
    }
    
    /*
    mutating func lowerme(){
        name=name.lowercased()
    }
 */
}
 /*

extension Wire {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


*/
