//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 06/12/25.
//

import SwiftUI

// Now start creating the project.
struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("No of cake: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Add special requests?", isOn:$order.specialRequestEnabled.animation())
                    
                    if(order.specialRequestEnabled){
                        Toggle("Add extra frosting", isOn:$order.extraFrosting.animation())
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles.animation())
                    }
                }
                
                Section{
                    NavigationLink("Delivery Details"){
                        AddressView(order: order)
                    }
                }
            }.navigationTitle("Cupcake Corner")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
