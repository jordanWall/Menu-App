//
//  itemRow.swift
//  iDine
//
//  Created by Jordan Wall on 2020-01-25.
//  Copyright © 2020 Jordan Wall. All rights reserved.
//

import SwiftUI

struct itemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item : MenuItem
    var body: some View {
        NavigationLink(destination: itemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct itemRow_Previews: PreviewProvider {
    static var previews: some View {
        itemRow(item: MenuItem.example)
    }
}
