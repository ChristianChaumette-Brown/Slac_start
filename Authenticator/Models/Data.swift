/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import UIKit
import SwiftUI
import CoreLocation

struct MyStruct {
    let title: String
   // let selected: Bool
}


 var folderArr = [String]()



let wireData: [Wire] = load("csvjson.json")
var searchData = [""]
var folderData: [String] = [""]
var folders : [String:Int]=[:]


func folderBuild(){
    //var i = 0
    for  i in wireData {
        //let searchTerm = wireData[0].name
      //  let category = i.category
        let category = i.Jobnum
        let keyExists = folders[category] != nil
        
        if keyExists{
            folders.updateValue((folders[category]!+1), forKey: category)
        }
        else{
            folders.updateValue(1, forKey: category)
        }
    }
   // wireData
   // print(wireData)
    
    print(folders)
    for (key, value) in folders {
        folderArr.append("\(key) Number of wires: \(value)")
    }
    print(folderArr[0])
    
    folderArr = folderArr.sorted()
    
    print(folderArr)
}




/*
func quicksort<T: Comparable>(_ a: [T])-> [T]{
    guard a.count > 1 else {return a}
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot}
    let equal = a.filter {$0 == pivot}
    let greater = a.filter {$0 > pivot}
    
    return quicksort(less) + equal + quicksort(greater)
    
    
}
*/


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    //let name: String
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
    }
        
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
/*
final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}


*/
