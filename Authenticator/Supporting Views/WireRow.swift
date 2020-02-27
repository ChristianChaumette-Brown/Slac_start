//
//  WireRow.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct WireRow: View {
    var wire: Wire
    var body: some View {
        HStack{
            wire.image
            .resizable()
                .frame(width: 50, height: 50)
            Text(wire.name)
            Text(String(wire.id))
            Text("Group: ")
            Text(wire.category)
            Spacer()
        }
    }
}

struct WireRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WireRow(wire:wireData[0])
            WireRow(wire:wireData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
