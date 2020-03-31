//
//  FolderView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 3/31/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct FolderView: View {
    
    var body: some View {
        List(folderArr,id: \.self){
            Text($0)
    }
}
}
struct FolderView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView()
    }
}


