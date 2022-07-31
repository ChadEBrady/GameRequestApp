//
//  CheckoutView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct CheckoutView: View {

    @StateObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.cart) { game in
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
                .navigationTitle(Strings.checkout)
                .listStyle(.plain)
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel()
        viewModel.mockCart()

        return CheckoutView(viewModel: viewModel)
    }
}
