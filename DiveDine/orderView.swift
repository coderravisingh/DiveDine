//
//  orderView.swift
//  DiveDine
//
//  Created by Ravi Singh on 03/02/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI


struct orderView: View {
    @EnvironmentObject var order : Order

    var body: some View {
 
        NavigationView {
            List {
                Section {
                    ForEach (order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("Rs\(item.price)")
                          //      .font(.largeTitle)
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckOutView()) {
                       Text("Place order")
                    }
   
                }.disabled(order.items.isEmpty)
            }.navigationBarTitle("order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct orderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        orderView().environmentObject(order)
    }
}
