//
//  DataModel.swift
//  iSip
//
//  Created by Elijah Armande on 10/18/22.
//

import Foundation
import SwiftUI


class Coffee: Codable, Identifiable, ObservableObject{
    var id: Int
    var name: String
    var price: Int
    var description: String
    var nutritionFacts: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, name: String, price: Int, description: String, imageName: String, nutritionFacts: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.imageName = imageName
        self.nutritionFacts = nutritionFacts
    }
    
    //MARK: For the simulator preview
    static let example = Coffee( id: 1, name: "Pumpkin Cream Cold Brew", price: 6, description: "Cold Brew sweetened with vanilla syrup and topped with a pumpkin cream cold foam and a dusting of pumpkin spice topping.", imageName: "pumpkin-cream-cold-brew", nutritionFacts: "250 calories, 31g sugar, 12g fat")
   
    
}


extension Coffee: Equatable {
    static func == (lhs: Coffee, rhs: Coffee) -> Bool {
        return
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.description == rhs.description &&
        lhs.imageName == rhs.imageName &&
        lhs.nutritionFacts == rhs.nutritionFacts
    }
}

//MARK: This class (API) marked with @MainActor allows me to run an async function that updates the UI on the main thread
@MainActor
class API: ObservableObject {
    @Published var coffees = [Coffee]()
    
    func getAPI() async {
//MARK: This URL is a link to a server provided by github which houses the JSON data.
        guard let url = URL(string: "https://my-json-server.typicode.com/Armandelij/mockjson/Coffee") else {
                print("Bad URL")
                return
        }
            
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                
            if let decodedResponse = try? JSONDecoder().decode([Coffee].self, from: data) {
                coffees = decodedResponse
                }
            
        } catch {
            print("Something went wrong")
        }
    }
}



