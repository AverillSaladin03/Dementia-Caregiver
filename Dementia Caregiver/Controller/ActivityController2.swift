//
//  ActivityContoller2.swift
//  Dementia Caregiver
//
//  Created by Reyner Fernaldi on 30/06/23.
//

import Foundation
import CoreData


struct Activitties: Decodable {
    var activity: [Activitty]
}
struct Activitty : Decodable {
    var nama: String
    var deskripsi: String
    var durasi : Int
    var tips : String
    var disability_lv : Int
    var dementia_lv : Int
    var hobby : String
    var category : [String]
}


class ActivityController2{
    let dataManager = DataManager.shared
    @Published var activities: [Activity] = []
    
    func loadJson(filename fileName: String) -> [Activitty]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Activitties.self, from: data)
                return jsonData.activity
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func addActivityFromJSON(demLevel : Int, disLevel: Int, hobbies: [Items]) {
        if let activityJson = loadJson(filename: "ActivityData") {
            
            print ("Jumlah activity: %@", activityJson.count)
            for activityData in activityJson {
//                print(activityData.nama)
                let newActivity = Activity(context: dataManager.context)
                newActivity.name = activityData.nama
                newActivity.descriptionActivity = activityData.deskripsi
                newActivity.duration = Int64(activityData.durasi)
                newActivity.tips = activityData.tips
                newActivity.disabilityLevel = Int64(activityData.disability_lv)
                newActivity.dementiaLevel = Int64(activityData.dementia_lv)
                newActivity.hobby = activityData.hobby
//                newActivity.addToCategory_activity(activityData.category)
                
                let categories = CategoryController().getCategoryByID(idCategories: activityData.category)
                
                //untuk mengisi category dari activity yang baru
//                newActivity.category_activity?.addingObjects(from: categories)
                //untuk mengisi activity yang baru ke category yang sudah ada
                for category in categories {
                    newActivity.addToCategory_activity(category)
                }
                

                // Save the new activity to Core Data
                dataManager.save()
            }
            print("masuk")
        }
        else {
            print("tidak")
        }
    }
    
//    func addActivity(newName: String, newDescription: String, newDuration: Int64, newTips: String, newDisabilityLevel: Int64, newDementiaLevel: Int64) {
////
//    }
    
    func getActivity() -> [Activity]{
        let request = NSFetchRequest<Activity>(entityName: "Activity")
        
        do{
            activities = try dataManager.context.fetch(request)
        }catch let error{
            print("error fetching core data. \(error.localizedDescription)")
        }
        return activities
    }

}

