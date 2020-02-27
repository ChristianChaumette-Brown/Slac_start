import SwiftUI
import Combine
import Foundation

class User: NSObject, ObservableObject  {
    @Published var usern = ""
    @Published var passw = ""
    @Published dynamic var confirmed = loginData[0].name
    @Published dynamic var cpass = loginData[0].password
    
   // let name : String
   // let pass : String
   // let auth : Bool
   // @Published var id: "";
 //   var name: String
 //   var password: String
   // var logs : Login
    
    func acq(){
        confirmed = loginData[0].name
        cpass = loginData[0].password
        
       // loginData.prepend(load2("ServerRec2.json"))
       // loginData[1].name=loginData[0].name
        //dynamically rebuilds the members of the class, need to have a way to dynamically call to have loginData remade
       /* func saveUploadedFilesSet(fileName:[String : Any]) {
            let file: FileHandle? = FileHandle(forWritingAtPath: "ServerRec3.json")

            if file != nil {
                // Set the data we want to write
                var dictonary: [String :Any] = [
                
                    "question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                    "answers":["True", "False"],
                    "correctIndex":0,
                    "module":3,
                    "lesson":0,
                    "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
                
                 ]
                do{
                    if let jsonData = try JSONSerialization.data(withJSONObject: fileName, options: .init(rawValue: 0)) as? Data
                    {
                        // Check if everything went well
                        print(NSString(data: jsonData, encoding: 1)!)
                        file?.write(jsonData)

                        // Do something cool with the new JSON data
                    }
                }
                catch {

                }
                // Write it to the file

                // Close the file
                file?.closeFile()
            }
            else {
                print("Ooops! Something went wrong!")
            }
        }
        
        func getUploadedFileSet(filename:String) {
            if let path = Bundle.main.path(forResource: "ServerRec2", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["name"] as? String {
                        // do stuff
                        print(person)
                        confirmed=person.self
                    }
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let passcode = jsonResult["password"] as? String {
                                           // do stuff
                        print(passcode)
                        cpass=passcode.self
                                       }
                } catch let error {
                    print("parse error: \(error.localizedDescription)")
                }
            } else {
                print("Invalid filename/path.")
            }
        }
       */
   
    
}

//func

}


