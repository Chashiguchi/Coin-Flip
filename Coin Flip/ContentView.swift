//
//  ContentView.swift
//  Coin Flip
//
//  Created by chase Hashiguchi on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomText(text: "Coin Flip")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomText: View {
    let text: String
    var body: some View{
        Text(text).font(Font.custom("Marker Felt", size: 36))
    }
}
