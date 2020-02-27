//
//  Login.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/26/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
class cleaner {
    deinit {
        print("Clean login")
    }
}
struct Login: Hashable, Codable{
    var name : String
     var password : String
    var authorized : Bool
    //let name_in : String
    //let pass : String
   // let auth : Bool
    //let login = Bundle.main.decode(User.self, from: "Server.json")
    
  // enum CodingKeys : String, CodingKey{
    //   case name_in = "user_name"
    //   case pass = "password"
    //   case auth = "success"
  // }
   // var cleans = cleaner()
/*
    init(from decoder:Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           name_in = try container.decode(String.self, forKey: .name_in)
           pass = try container.decode(String.self, forKey: .pass)
           //date = try container.decode(Date.self, forKey: .date)
           auth = try container.decode(Bool.self, forKey: .auth)
       } */
    
    
   }
/*

let decoder = JSONDecoder()
var jsonResult = try decoder.decode(Login.self, from: json!)

// Change status
jsonResult.activeProfileComplete![0].status = "processed"

// Encode new updated json to data
let encoder = JSONEncoder()
var encodeData = try encoder.encode(jsonResult)
*/
