//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 06/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var emailId: String = ""
    
    var body: some View {
        Form{
            Section{
                TextField("Enter username",text: $username)
                TextField("Enter EmailId",text: $emailId)
            }
            
            Section{
                Button("Create account"){
                    // Do something.
                }
            }.disabled(username.isEmpty || emailId.isEmpty)
        }
    }
}

#Preview {
    ContentView()
}
