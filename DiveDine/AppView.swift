//
//  AppView.swift
//  DiveDine
//
//  Created by Ravi Singh on 04/02/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI


struct AppView: View {
    
   
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            
            orderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                    
          
            }
   
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        AppView().environmentObject(order)
    }
}
