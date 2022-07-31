//
//  HomeView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct HomeView: View {

    var viewModel: SearchViewModel

    var body: some View {
        TabView {
            SearchView(viewModel: viewModel)
            .tabItem {
                Label(Strings.search,
                      systemImage: "magnifyingglass")
            }
            CheckoutView()
            .tabItem {
                Label(Strings.checkout,
                      systemImage: "cart")
            }
        }.onAppear {
            viewModel.mockGames()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel()
        viewModel.mockGames()
        viewModel.mockCart()

        return HomeView(viewModel: viewModel)
    }
}
