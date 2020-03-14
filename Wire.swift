//
//  Wire.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//
// Priscilla's Branch
import SwiftUI

struct Wire: Hashable, Codable, Identifiable {
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
var state: String
var park: String
var city: String
    
    mutating func lowerme(){
        name=name.lowercased()
    }
}
    

extension Wire {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}


