import Foundation
import UIKit
import SwiftUI

class WineVM : ObservableObject, Identifiable {
    
    private let wine: Wine
    
    let defaultImageUrl = "https://images.squarespace-cdn.com/content/v1/5edfcebba491432376be8444/1618710129409-1UMAUOPZVB8HTXJNK1HK/somm-icon-tm+%281%29.png"
    
    init(wine:Wine) {
        self.wine = wine
    }
    
    var name:String {
        wine.name
    }
    
    var images:[Image] {
        if wine.images == nil {
            return [Image(id: "1", url: defaultImageUrl)]
        } else if wine.images!.isEmpty {
            return [Image(id: "1", url: defaultImageUrl)]
        } else {
            return wine.images!
        }
        
    }
        
    var varietalLabel:String {
        wine.varietal.label
    }
    
    var varietalColor:String {
        wine.varietal.color.name
    }
       
    var producerName:String {
        wine.producer?.name ?? "Unknown Producer"
    }
    
    var region:String {
        wine.region?.name ?? "Unknown Region"
    }
    
    var regionCountry:String {
        wine.region?.country.name ?? "Unknown Country"
    }
    
}



