//
//  CheckoutView.swift
//  GameSearchApp
//
//  Created by Chad Brady on 7/30/22.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {

                }
                .navigationTitle(Strings.checkout)
                .listStyle(.plain)
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
