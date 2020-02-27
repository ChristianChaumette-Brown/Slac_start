/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import UIKit
import SwiftUI
import CoreLocation

var toggled : Bool = true
var input : String = "ServerRec.json"

//flip()


var loginData : [Login] = load2(input)

//loginData : [Login] = load2(input)

//let loginData2 : Login = load2("ServerRec2.json")
//load2<T: Decodable>(_ filename: String) -> T
func load2<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func toggle(){
    if toggled == true
    {
        toggled=false
    }
    else{
        toggled=true
    }
        
}

func flip(){
    if toggled == false{
        input = "ServerRec2.json"
    }
}



