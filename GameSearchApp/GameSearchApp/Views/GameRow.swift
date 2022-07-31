//
//  GameRow.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct GameRow: View {

    private struct Constants {
        static let imageSizeLength = 75.0
    }

    let game: Game
    let inCart: Bool

    var body: some View {
        HStack {
            AsyncImage(url: game.image.thumbnailURL) { phase in

                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    ZStack {
                        Rectangle().background(Color.gray)
                        Image(systemName: "exclamationmark.square.fill").foregroundColor(.red).imageScale(.large)
                    }
                } else {
                    Rectangle().background(Color.gray)
                }
            }
            .frame(
                width: Constants.imageSizeLength,
                height: Constants.imageSizeLength)
            .aspectRatio(contentMode: .fit)
            Text(game.name)
            Spacer()
            let imageName = inCart ? "cart.badge.minus" : "cart.badge.plus"
            Image(systemName: imageName).imageScale(.large)

        }.padding([.leading, .trailing], .padding8)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game.mockGame()
        GameRow(
            game: game,
            inCart: true)
    }
}
