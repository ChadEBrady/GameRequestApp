//
//  SearchView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct SearchView: View {

    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                List {

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
        SearchView()
    }
}
