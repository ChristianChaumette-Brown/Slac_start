//
//  WireList.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct WireList: View {
     var body: some View {
     NavigationView {
                List(wireData) { wire in
                    NavigationLink(destination: WireDetail(wire: wire)) {
                        WireRow(wire: wire)
                    }
                }
                
                .navigationBarTitle(Text("Wires"))
            }
        }
    }

    struct WireList_Previews: PreviewProvider {
        static var previews: some View {
            ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
                WireList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
