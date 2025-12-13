//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 06/12/25.
//

import SwiftUI

@Observable
class User:Codable{
    enum CodingKeys:String,CodingKey{
        case _name = "name"
    }
    var name:String = "Susan"
}

struct ContentView: View {
    
    var body: some View {
        Button("Encode Data",action: encodedData)
    }
    
    func encodedData(){
        let user = User()
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user){
            print(String(data: encoded, encoding: .utf8)!)
        }
    }
}

#Preview {
    ContentView()
}
