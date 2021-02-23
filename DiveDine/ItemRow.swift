//
//  ItemRow.swift
//  DiveDine
//
//  Created by Ravi Singh on 30/01/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let Colors: [String : Color] = ["D": .purple, "V": .green, "G": .orange, "N": .red, "S": .blue]
    var items : MenuItem
    var body: some View {
        NavigationLink(destination: itemDetails(item: items)) {
        HStack {
            Image(items.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            //     Text(items.restrictions)
            
            VStack (alignment: .leading) {
                Text(items.name)
                    .font(.headline)
                Text("Rs \(items.price)")
            }
            
            Spacer()
            
            ForEach (items.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(ItemRow.Colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
                
                }
            }
            
        }
        
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(items: MenuItem.example)
    }
}
