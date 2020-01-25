//
//  AppView.swift
//  iDine
//
//  Created by Jordan Wall on 2020-01-25.
//  Copyright © 2020 Jordan Wall. All rights reserved.
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
