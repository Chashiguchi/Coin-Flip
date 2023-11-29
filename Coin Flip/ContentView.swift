//
//  ContentView.swift
//  Coin Flip
//
//  Created by chase Hashiguchi on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    @State private var randomValue = 0
    var body: some View {
        VStack {
            CustomText(text: "Coin Flip")
            Image("Coin")
                .resizable()
                .frame(width:200, height:200, alignment: .center)
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 0, z: 0))
                .onTapGesture {
                    chooseRandom(times: 10)
                }
        }
        .padding()
    }
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                randomValue = Int.random(in: 1...12)
                chooseRandom(times: -1)
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                    rotation += 360
                }
            }
        }
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
