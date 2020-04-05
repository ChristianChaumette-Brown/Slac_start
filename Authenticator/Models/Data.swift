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

let file0 = "projects.json"
let file1 = "_rci.json"
let file2 = "_cables.json"

let wireData: [Wire] = load("csvjson.json")
var searchData = [""]
var folderData: [String] = [""]
var folders : [String:Int]=[:]


class DataAssignment: ObservableObject{
    @Published var logins = UserDefaults.standard.integer(forKey: "logins"){
        didSet { UserDefaults.standard.set(self.logins, forKey: "logins") }
    
    }
    
   @Published var projects :[project] = []

    init(){
        print("Initializer called")
        
        //check for initial app launch
        if(logins < 1){
            print("Initial launch data load")
            createInitFiles()
        }
        else{
            print("Loading files")
            projects = load(file0)
        }
        
    }
    
    
    func createInitFiles(){
        print("called createfiles")
        let str = "[]"
        let path0 = file0

        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(path0)
        do {
            try str.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }
        
      if(projects.capacity != 0){
            for i in 0...projects.capacity{
                url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(projects[i].area_code+file1)
                let url2 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(projects[i].area_code+file2)
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                } catch {
                    print(error.localizedDescription)
                }
                do {
                    try str.write(to: url2, atomically: true, encoding: .utf8)
                } catch {
                    print(error.localizedDescription)
                }
                
                
            }
        }
        
    }
    
    
    
}


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
     let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
    /*
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    */
    print(file)
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

