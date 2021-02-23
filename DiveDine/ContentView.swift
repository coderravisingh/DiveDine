//
//  ContentView.swift
//  DiveDine
//
//  Created by Ravi Singh on 30/01/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section (header: (Text(section.name))){
                    
                        
                        ForEach(section.items) { item in
                            ItemRow(items: item)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Menu", displayMode: .large)
        .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
