//
//  FolderView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 3/31/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI
import UIKit

struct FolderView: View {
    
    var body: some View {
        NavigationView{
        List(folderArr,id: \.self){ wire in
            NavigationLink(destination: WireList()){
                Text(wire)
            }
            
        }
        .navigationBarTitle("Folders")
        }
    }
}



struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView()
    }
}


