//
//  CategoryController.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 06/07/23.
//

import Foundation
import CoreData

struct CategoryModel: Decodable {
    var category: [Categorry]
}
struct Categorry : Decodable {
    var idCategory: String
    var name: String
}

func loadCategory(filename fileName: String) -> [Categorry]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(CategoryModel.self, from: data)
            return jsonData.category
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}

class CategoryController{
    let dataManager = DataManager.shared
    @Published var categories: [Category] = []
    
    func addCategory() {
        if let categoryJson = loadCategory(filename: "CategoryData") {
            for categoryData in categoryJson {
                let newCategory = Category(context: dataManager.context)
                newCategory.id = UUID()
                newCategory.idCategory = categoryData.idCategory
                newCategory.name = categoryData.name
                
                // Save the new category to Core Data
                dataManager.save()
            }
        }
    }
    
    func getCategoryByID(idCategories: [String]) -> [Category] {
        var categories: [Category] = []
        let request = NSFetchRequest<Category>(entityName: "Category")

        let filter = NSPredicate(format: "idCategory IN %@", idCategories)
        request.predicate = filter

        do {
            categories = try dataManager.context.fetch(request)
        } catch let error{
            print("Error fetching. \(error.localizedDescription)")
        }
        return categories
    }
    
    func getAllCategory() -> [Category]{
        let request = NSFetchRequest<Category>(entityName: "Category")

        do{
            categories = try dataManager.context.fetch(request)
        }catch let error{
            print("error fetching core data. \(error.localizedDescription)")
        }
        return categories
    }
    
}
