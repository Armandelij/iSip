//
//  Splash Screen.swift
//  iSip
//
//  Created by Elijah Armande on 10/19/22.
//

import SwiftUI

struct Splash_Screen: View {
    @StateObject var order = Order()
    @State var isActive: Bool = false
    @State private var size = 0.8
    
    var body: some View {
        if isActive {
            MainView()
                .environmentObject(order)
        } else {
            ZStack {
                Color("coffee")
                
                VStack {
                    Spacer()
                    Image("logo")
                    
                    Spacer()
                    Text("iSIP")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("splash-screen"))
                        .padding(.bottom, 30)
                }
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
            Splash_Screen()
        
    }
}
