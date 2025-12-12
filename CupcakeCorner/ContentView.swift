//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 06/12/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        AsyncImage(url: URL(string:"https://hws.dev/img/logo.png")){ image in
            image
                .resizable()
                .scaledToFit()
        }placeholder:{
            ProgressView()
        }
        .frame(width:200,height:200)
    }
}

#Preview {
    ContentView()
}
