//
//  LoginView.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/26/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var usern: String = ""
    @State private var passw: String = ""
    @EnvironmentObject var user: User
    var body: some View {
        VStack(alignment: .leading){
            TextField("Username", text: $usern)
            SecureField("Password", text: $passw)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
