//
//  orderView.swift
//  iDine
//
//  Created by Jordan Wall on 2020-01-25.
//  Copyright © 2020 Jordan Wall. All rights reserved.
//

import SwiftUI

struct orderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }.navigationBarTitle("Order")
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
