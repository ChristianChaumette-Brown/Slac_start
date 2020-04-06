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
    var projnumb: Int
    var body: some View {
        HStack{
            /*
            wire.image
            .resizable()
                .frame(width: 50, height: 50)
            */
            //Text(projects[projnumb].cables![wire].Cablenum)
            Text(wire.Cablenum ?? "test")
            //Text(String(wire.id))
            Text("Group: ")
            Text(wire.Jobnum ?? "test_job")
            Spacer()
        }
    }
}
/*
struct WireRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WireRow(wire:"test", projnumb: 0)
            WireRow(wire:"test 2", projnumb: 0)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
*/
