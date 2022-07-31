//
//  SearchView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct SearchView: View {

    @State private var searchText = ""
    @StateObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.games) { game in
                        Text(game.name)
                    }
                }
                .searchable(text: $searchText)
                .navigationTitle(Strings.games)
                .listStyle(.plain)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel()
        viewModel.mockGames()

        return SearchView(viewModel: viewModel)
    }
}
