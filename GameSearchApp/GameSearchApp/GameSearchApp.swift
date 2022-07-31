//
//  GameSearchApp.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

@main
struct GameSearchApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: SearchViewModel())
        }
    }
}
