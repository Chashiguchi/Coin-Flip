//
//  ContentView.swift
//  Coin Flip
//
//  Created by chase Hashiguchi on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rotation = 0.0
    @State private var coinSide = "Heads"
    @State private var isFlipped = false
    var body: some View {
        VStack {
            Image("Coin 1")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
            CustomText(text: "Coin Flip")
                .padding(20)
            Image("\(coinSide)")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .rotation3DEffect(.degrees((rotation)), axis: (x: 1, y: 0, z: 0))
                .animation(.easeInOut(duration: 0.5))
            Button("Flip Coin") {
                coinSide = Bool.random() ? "Heads" : "Tails"
                chooseRandom(times: 2)
                isFlipped.toggle()
            }
        }
        .padding()
    }
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                chooseRandom(times: -1)
                withAnimation(.interpolatingSpring(stiffness: 2, damping: 5)) {
                    if Bool.random() {
                        coinSide = "Heads"
                    } else {
                        coinSide = "Tails"
                    }
                    rotation += 3600
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
