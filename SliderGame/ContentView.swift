//
//  ContentView.swift
//  SliderGame
//
//  Created by Анастасия Булдакова on 22.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100) // текущее значение
    @State private var sliderValue = 0.0 // значение слайдера
    @State private var alertPresented = false // алерт
    
    var body: some View {
        VStack (spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
               
            HStack {
                Text("1")
                UIKitSliderView(valueSlider: $sliderValue, opacitySlider: Double(computeScore()) / 100.0)
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                checkButtonPress()
            }
          
            Button("Начать заново") {
                startButtonPress()
            }
        }
        .alert("Your score", isPresented: $alertPresented, actions: {}) {
            Text("\(computeScore())")
        }
    }
}

extension ContentView {
    private func startButtonPress(){
        self.targetValue = Int.random(in: 1...100)
    }
}

extension ContentView {
    private func checkButtonPress(){
        alertPresented = true
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
