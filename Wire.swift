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
    var Area_Code: String
    var Jobnum: String
    var Cablenum: String
    var System: String
    var Func: String
    var Cabletype: String
    var Origin_Location: String
    var Origin_Station: String
    var Origin_Conntype: String
    var Origin_Instr: String
    var Destination_Location: String
    var Destination_Station: String
    var Destination_Conntype: String
    var Destination_Instr: String
    var Length: String
    var Routing: String
    var Newrev: String
    //var project: String
    
    enum CodingKeys: String, CodingKey{
        case Area_Code, Jobnum, Cablenum, System, Func, Cabletype, Origin_Location, Origin_Station, Origin_Conntype, Origin_Instr, Destination_Location, Destination_Station, Destination_Conntype, Destination_Instr, Length, Routing, Newrev
        //, project
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
struct project:Hashable, Codable, Identifiable{
    var id = UUID()
    var area_code:String?
    
}

struct rci: Hashable, Codable,Identifiable{
    var id = UUID()
    var Cablenum : String?
    var project: String?
    var INSTALL_STATUS: Bool?
    var INSTALL_STATUS_user: String?
    var INSTALL_STATUS_date: String?
    var VERIFY_SOURCE: Bool?
    var VERIFY_SOURCE_user: String?
    var VERIFY_SOURCE_date: String?
    var VERIFY_DEST: Bool?
    var VERIFY_DEST_user: String?
    var VERIFY_DEST_date: String?
    var ORIGIN_TERM: String?
    var ORIGIN_TERM_user: String?
    var ORIGIN_TERM_date: String?
    var DEST_TERM: Bool?
    var DEST_TERM_user: String?
    var DEST_TERM_date: String?
    var VERIFY_CONN_ORIGIN: Bool?
    var VERIFY_CONN_ORIGIN_user: String?
    var VERIFY_CONN_ORIGIN_base: String?
    var VERIFY_CONN_DEST: Bool?
    var VERIFY_CONN_DEST_user: String?
    var VERIFY_CONN_DEST_date: String?
    var TESTED: Bool?
    var TESTED_user: String?
    var TESTED_date: String?
    var CONN_ORIGIN: Bool?
    var CONN_ORIGIN_user: String?
    var CONN_ORIGIN_date: String?
    var CONN_DEST: Bool?
    var CONN_DEST_user: String?
    var CONN_DEST_date: String
    var RELEASED: Bool?
    var RELEASED_user: String?
    var RELEASED_date: String?
    var COMMENT_SOURCE: String?
    var COMMENT_DEST: String?


}
