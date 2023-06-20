//
//  Aktivitas.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import Foundation
import SwiftUI

struct Aktivitas: Identifiable, Codable {
    var id: Int
    var name: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
}
