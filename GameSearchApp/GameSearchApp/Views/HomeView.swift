//
//  HomeView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        TabView {
            SearchView()
            .tabItem {
                Label(Strings.search,
                      systemImage: "magnifyingglass")
            }
            CheckoutView()
            .tabItem {
                Label(Strings.checkout,
                      systemImage: "cart")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
