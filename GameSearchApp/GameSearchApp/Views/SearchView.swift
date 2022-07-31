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
                        NavigationLink(destination: DetailView(game: game)) {
                            HStack {
                                GameRow(game: game)
                                Spacer()
                                Button(action: {
                                    viewModel.addRemoveGame(game)
                                }, label: {
                                    let imageName = viewModel.inCart(game) ? "cart.badge.minus" : "cart.badge.plus"
                                    Image(systemName: imageName).imageScale(.large).padding(.padding8)
                                })
                                .buttonStyle(.plain)
                            }
                        }
                    }

                    if
                        viewModel.games.count > 0,
                        !viewModel.lastPage
                    {
                        HStack {
                            Spacer()
                            Text(Strings.findMore)
                            .padding(.padding8)
                            .foregroundColor(Color.blue)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.fetch(str: searchText, nextPage: true)
                        }
                    }
                }
                .searchable(text: $searchText)
                .onSubmit(of: .search) {
                    viewModel.fetch(str: searchText)
                }
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
