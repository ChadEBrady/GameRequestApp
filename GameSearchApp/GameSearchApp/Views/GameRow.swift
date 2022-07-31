//
//  GameRow.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct GameRow: View {

    let game: Game
    let inCart: Bool

    var body: some View {
        HStack {
            Text(game.name)
            Spacer()

            let imageName = inCart ? "cart.badge.minus" : "cart.badge.plus"
            Image(systemName: imageName).imageScale(.large)

        }.padding([.leading, .trailing], .padding8)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(id: 1, name: "Game 1")
        GameRow(
            game: game,
            inCart: true)
    }
}
