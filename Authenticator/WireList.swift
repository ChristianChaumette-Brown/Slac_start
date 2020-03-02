//
//  WireList.swift
//  Authenticator
//
//  Created by Christian Chaumette-Brown on 2/25/20.
//  Copyright © 2020 Christian Chaumette-Brown. All rights reserved.
//

import SwiftUI

struct WireList: View {
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar = UISearchBar()
    @State private var searchText :String = ""
    //var newWire : [Wire] = []
    lazy var newWire=wireData.filter{$0.name.contains(searchText)||searchText==""}
    
    
    var body: some View {
        
        
        
        NavigationView {
            // searchBar(Text)
            VStack{
                TextField("Search", text : $searchText)
                    .padding(.horizontal, 21.0)
                
                List(wireData.filter{$0.name.contains(searchText.lowercased())||searchText==""}) {wire in
                    
                    NavigationLink(destination: WireDetail(wire: wire)) {
                        
                        WireRow(wire:wire)
                        
                    }
                    
                    
                }
                    
                .navigationBarTitle(Text("Wires"))
                
            }
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

