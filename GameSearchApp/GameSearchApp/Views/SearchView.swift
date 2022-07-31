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
                        HStack {
                            GameRow(
                                game: game,
                                inCart: viewModel.inCart(game))
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.addRemoveGame(game)
                            }
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
        viewModel.mockCart()

        return SearchView(viewModel: viewModel)
    }
}
