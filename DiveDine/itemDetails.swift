//
//  itemDetails.swift
//  DiveDine
//
//  Created by Ravi Singh on 02/02/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI
//import UserNotifications


struct itemDetails: View {
    @EnvironmentObject var order: Order

    var item : MenuItem
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing){
               Image(item.mainImage)
                Text("Photo By: \(item.photoCredit)")
                 .padding(5)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            
                
            }
            
            Text(item.description)
            .padding()
            Button ("Order") {
                self.order.add(item: self.item)

            }.font(.headline)
               
         
            Spacer()
            
        }.navigationBarTitle(Text("\(item.name)"), displayMode: .inline )
 
    }
}

struct itemDetails_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        NavigationView {
            itemDetails(item: MenuItem.example).environmentObject(order)
        }
    }
}
