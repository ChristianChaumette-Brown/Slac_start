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
let defaults = UserDefaults.standard
let file0 = "projects.json"
let file1 = "_rci.json"
let file2 = "_cables.json"
let server = "http://10.0.0.236:5000"
//let server = "http://e6ea27fd.ngrok.io"
//let server = "http://slacable.serverless.social"
//let wireData: [Wire] = loader("csvjson.json")
var searchData = [""]
var folderData: [String] = [""]
var folders : [String:Int]=[:]
var userID: String = ""
var completeFolders = [[String:Int]]()
var completeFoldersArr = [[String]]()
var changes : [Changes] = []
var uploader: String = ""
var pushMessage: String = ""
/*
var successfulLogins = UserDefaults.standard.integer(forKey: "logins"){
    didSet { UserDefaults.standard.set(successfulLogins, forKey: "logins") }

}
*/
var projects : [project] = []





func start(){
    
        print("Initializer called")
        
        //check for initial app launch
    let successfulLogins = UserDefaults.standard.bool(forKey: "First Launch")
        if(successfulLogins == true){
            print("Initial launch data load")
            createInitFiles()
        }
        else{
            print("Loading files")
            projects = load(file0)
            if (projects.capacity != 0){
                loadFiles()
        }
        
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
func loadFiles(){
        if(projects.capacity != 0){
            for i in 0...projects.capacity-1{
                projects[i].cables = load(projects[i].area_code+file2)
                projects[i].rOfInstall = load(projects[i].area_code+file1)
                print("loaded \(projects[i].area_code+file2)")
                print("loaded \(projects[i].area_code+file1)")
            }
        }
        print(projects[0].rOfInstall)
    print(projects[0].rOfInstall![0])
    }
    func loadProjectFiles(i: Int,file: Int){
        
        if(file == 0){
        projects[i].cables = load(projects[i].area_code+file2)
        }
        else{
        projects[i].rOfInstall = load(projects[i].area_code+file1)
        }
        
    }
    func updateData(){
        print("updating data...")
        fetchProjects()
    }
    func fetchProjects(){
           print("Fetching projects...")
           let session = URLSession.shared
        //:5000
           let url = URL(string: "\(server)/ws/projects/")!
           let task = session.dataTask(with: url) { data, response, error in
           
               let str = String(decoding: data!, as: UTF8.self)
                   print(str)
                   let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file0)
                   
                   do {
                       try str.write(to: url1, atomically: true, encoding: .utf8)
                       
                   } catch {
                       print(error.localizedDescription)
                   }
               
               DispatchQueue.main.async {
                   print("loading projects")
                projects = load(file0)
                   fetchFiles()
                   //folderBuild()
               }
           }
           task.resume()
           
       }
       
       
       func fetchFiles(){
        print("Fetch files called")
        print(projects.capacity)
           if(projects.capacity != 0){
               for i in 0...projects.capacity-1{
                   let session = URLSession.shared
                //:5000
                   let url = URL(string: "\(server)/ws/\(projects[i].area_code)/cables/")!
                   let task = session.dataTask(with: url) { data, response, error in
                           let str = String(decoding: data!, as: UTF8.self)
                           print("Fetched")
                           let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(projects[i].area_code+file2)
                           do {
                               try str.write(to: url, atomically: true, encoding: .utf8)
                               DispatchQueue.main.async {
                                   loadProjectFiles(i: i, file: 0)
                               }
                           } catch {
                               print(error.localizedDescription)
                           }
                       }
                   task.resume()
//currently contains my local ip address for testing
                   let session2 = URLSession.shared
                //:5000
                   let url2 = URL(string: "\(server)/ws/\(projects[i].area_code)/rci/")!
                   let task2 = session2.dataTask(with: url2) { data, response, error in
                           let str2 = String(decoding: data!, as: UTF8.self)
                           let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(projects[i].area_code+file1)
                           do {
                               try str2.write(to: url1, atomically: true, encoding: .utf8)
                               DispatchQueue.main.async {
                                   loadProjectFiles(i: i, file: 1)
                               }

                       } catch {
                           print(error.localizedDescription)
                       }
               }
               task2.resume()
    
           }
               
            //folderBuild()
       }
}

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
            if (projects.capacity != 0){
                loadFiles()
        }
        
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
    
    func loadFiles(){
        if(self.projects.capacity != 0){
            for i in 0...self.projects.capacity-1{
                self.projects[i].cables = load(self.projects[i].area_code+file2)
                self.projects[i].rOfInstall = load(self.projects[i].area_code+file1)
                print("loaded \(self.projects[i].area_code+file2)")
                print("loaded \(self.projects[i].area_code+file1)")
            }
        }
    }
    func loadProjectFiles(i: Int,file: Int){
        
        if(file == 0){
        self.projects[i].cables = load(self.projects[i].area_code+file2)
        }
        else{
        self.projects[i].rOfInstall = load(self.projects[i].area_code+file1)
        }
        
    }
    func updateData(){
        print("updating data...")
        self.fetchProjects()
    }
    func fetchProjects(){
           print("Fetching projects...")
           let session = URLSession.shared
        //:5000
           let url = URL(string: "\(server)/ws/projects/")!
           let task = session.dataTask(with: url) { data, response, error in
           
               let str = String(decoding: data!, as: UTF8.self)
                   print(str)
                   let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(file0)
                   
                   do {
                       try str.write(to: url1, atomically: true, encoding: .utf8)
                       
                   } catch {
                       print(error.localizedDescription)
                   }
               
               DispatchQueue.main.async {
                   print("loading projects")
                self.projects = load(file0)
                   self.fetchFiles()
                   
               }
           }
           task.resume()
           
       }
       
       
       func fetchFiles(){
           if(self.projects.capacity != 0){
               for i in 0...projects.capacity-1{
                   let session = URLSession.shared
                //:5000
                   let url = URL(string: "\(server)/ws/\(projects[i].area_code)/cables/")!
                   let task = session.dataTask(with: url) { data, response, error in
                           let str = String(decoding: data!, as: UTF8.self)
                           print("Fetched")
                           let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(self.projects[i].area_code+file2)
                           do {
                               try str.write(to: url, atomically: true, encoding: .utf8)
                               DispatchQueue.main.async {
                                   self.loadProjectFiles(i: i, file: 0)
                               }
                           } catch {
                               print(error.localizedDescription)
                           }
                       }
                   task.resume()
//currently contains my local ip address for testing
                   let session2 = URLSession.shared
                //:5000
                   let url2 = URL(string: "\(server)/ws/\(self.projects[i].area_code)/rci/")!
                   let task2 = session2.dataTask(with: url2) { data, response, error in
                           let str2 = String(decoding: data!, as: UTF8.self)
                           let url1 = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(self.projects[i].area_code+file1)
                           do {
                               try str2.write(to: url1, atomically: true, encoding: .utf8)
                               DispatchQueue.main.async {
                                   self.loadProjectFiles(i: i, file: 1)
                               }

                       } catch {
                           print(error.localizedDescription)
                       }
               }
               task2.resume()
    
           }
               
               
       }
}
}

func folderBuild(){
    
    for j in 0..<projects.count{
        
        var fold : [String:Int] = [:]
        
        for k in 0..<projects[j].cables!.count{
            let group = projects[j].cables![k].Jobnum
            let keyExists = fold[group] != nil
            
            if keyExists{
                //completeFolders[j][group] = (completeFolders[j][group]! + 1)
                fold.updateValue(fold[group]! + 1, forKey: group)
                //projects[j].folders.updateValue(projects[j].folders[group]!+1, forKey: group)
            }
            else{
               // projects[j].folders.updateValue(1, forKey: group)
                fold.updateValue(1, forKey: group)
            }
            
        }
        completeFolders.append(fold)
    }
    print(completeFolders)
    for j in 0..<projects.count{
        var fold : [String] = []
        for (key, value) in completeFolders[j]{
            fold.append("\(key) Number of Cables: \(value)")
            
            
        }
        completeFoldersArr.append(fold)
    }
    print(completeFoldersArr[0])
    
    for i in 0..<projects.count{
        completeFoldersArr[i] = completeFoldersArr[i].sorted()
        
    }
    for i in 0..<projects.count{
          print("project \(i) folders \(completeFoldersArr[i])" )
           
       }
    //var i = 0
    /*
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
 */
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
        if defaults.bool(forKey: "First Launch")==true{
            print("Reseting install")
            
            defaults.set(false, forKey: "First Launch")
        }
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

func loader<T: Decodable>(_ filename: String) -> T {
    let data: Data
    //let name: String
     /*let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)*/
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
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
