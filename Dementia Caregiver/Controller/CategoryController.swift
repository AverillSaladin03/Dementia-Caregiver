//
//  CategoryController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 05/07/23.
//

import Foundation
import CoreData

struct Cattegories: Decodable {
    var category: [Cattegory]
}
struct Cattegory : Decodable {
    var id: Int
    var nama: String
}

class CategoryController{
    
    let dataManager = DataManager.shared
    @Published var categories: [Category] = []
    
    func loadJson(filename fileName: String) -> [Cattegory]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Cattegories.self, from: data)
                return jsonData.category
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func addCategory() {
        if let categoryJson = loadJson(filename: "CategoryData") {
            for categoryData in categoryJson {
                let newCategory = Category(context: dataManager.context)
                newCategory.id = UUID()
                newCategory.name = categoryData.nama

                // Save the new category to Core Data
                dataManager.save()
            }
        }
    }
}
