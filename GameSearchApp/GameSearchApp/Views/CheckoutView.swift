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
                            GameRow(game: game)
                            Spacer()
                            Button(action: {
                                viewModel.addRemoveGame(game)
                            }, label: {
                                let imageName = viewModel.inCart(game) ? "cart.badge.minus" : "cart.badge.plus"
                                Image(systemName: imageName).imageScale(.large)
                            })
                            .buttonStyle(.plain)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                                
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
