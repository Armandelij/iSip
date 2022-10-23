//
//  DetailView.swift
//  iSip
//
//  Created by Elijah Armande on 10/21/22.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var order: Order
    @ObservedObject var coffee: Coffee
    
    var body: some View {
    VStack {
        Image(coffee.imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(width: 300, height: 400)
        
        
           
            Text(coffee.description)
                   
                .padding()
            
            Text(coffee.nutritionFacts)
                    
      
        Button("Add to Order") {
            order.add(item: coffee)
        }
        .padding()
        .background(Color("chocolate-brown"))
        .foregroundColor(Color("coffee"))
        .clipShape(Capsule())
            
        Spacer()
    }
    .navigationTitle(coffee.name)
    .navigationBarTitleDisplayMode(.inline)
    
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coffee: Coffee.example)
                .environmentObject(Order())
        }
    }
}
