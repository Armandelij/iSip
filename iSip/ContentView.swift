//
//  ContentView.swift
//  iSip
//
//  Created by Elijah Armande on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = API()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.coffees) { coffee in
                    NavigationLink(destination: DetailView(coffee: coffee)) {
                    HStack() {
                        Image(coffee.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color("chocolate-brown"), lineWidth: 2))
                        VStack(alignment: .leading) {
                            Text(coffee.name)
                            Text("$\(coffee.price)")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            //MARK: ASYNC ENVIRONMENT 
            .task {
                await vm.getAPI()
            }
        }
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
