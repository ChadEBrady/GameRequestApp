//
//  DetailView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct DetailView: View {

    let game: Game
    var body: some View {
        VStack {
            AsyncImage(url: game.image.screenURL) { phase in
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
            }.aspectRatio(contentMode: .fit)
            Spacer()
            Text(game.name).font(.largeTitle)
            Spacer()
            Text(game.deck).font(.body).padding(.padding8)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(game: Game.mockGame())
    }
}
