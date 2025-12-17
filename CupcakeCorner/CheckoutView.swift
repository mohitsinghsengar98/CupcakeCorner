//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Mohit Sengar on 14/12/25.
//

import SwiftUI

struct CheckoutView: View {
    var order:Order
    
    @State private var confirmationMessage:String = ""
    @State private var showingConfirmation:Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")){image in
                    image.resizable()
                        .scaledToFit()
                }placeholder: {
                    ProgressView()
                }.frame(height: 233)
                Text("Your total cost is \(order.cost, format: .currency(code: "INR"))")
                    .font(.title)
                Button("Place order", action: { Task{ await placeOrder() }
                })
                .padding()
                
            }
        }.navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .alert("Thank you", isPresented: $showingConfirmation, actions: {}, message: { Text(confirmationMessage) })
    }
    
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("Failed to encode order")
            return
        }
        
        let url =  URL(string: "https://postman-echo.com/post")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let (data,_) = try await URLSession.shared.upload(for: request, from:encoded)
            
            let rawData = String(decoding: data,as: UTF8.self)
            print("raw json data - \(rawData)")
            
            // handle response
            let decodedOrder = try JSONDecoder().decode(PostmanEchoResponse<Order>.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.data.quantity) × \(Order.types[decodedOrder.data.type].capitalized(with: Locale.init(identifier: "en_IN"))) cupcakes is on its way!"
            showingConfirmation = true
            
        }catch{
            print("Check out failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order:Order())
}
