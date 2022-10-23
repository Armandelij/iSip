//
//  iSipApp.swift
//  iSip
//
//  Created by Elijah Armande on 10/17/22.
//

import SwiftUI

@main
struct iSipApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
           Splash_Screen()
        }
    }
}
