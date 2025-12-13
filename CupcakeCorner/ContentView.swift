//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 06/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap count: \(counter)"){
            counter += 1
        }.sensoryFeedback(.increase, trigger: counter) // simple
//            .sensoryFeedback(.impact(weight: .heavy,intensity: 1), trigger: counter) // heavy vibration.
//            .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter) // soft vibration.
    }
}

#Preview {
    ContentView()
}
