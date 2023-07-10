//
//  ActivityContoller2.swift
//  Dementia Caregiver
//
//  Created by Reyner Fernaldi on 30/06/23.
//

import Foundation
import CoreData


struct ResponseData: Decodable {
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
}

func loadJson(filename fileName: String) -> [Activitty]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.activity
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}


class ActivityContoller2{
    
    static var shared = ActivityContoller2()
    let dataManager = DataManager.shared
    @Published var activitiesArray: [Activity] = []
    
    func addActivity() {
        if let activityJson = loadJson(filename: "Reyner") {
            for activityData in activityJson {
                let newActivity = Activity(context: dataManager.context)
                newActivity.id_activity = UUID()
                newActivity.name = activityData.nama
                newActivity.descriptionActivity = activityData.deskripsi
                newActivity.duration = Int16(activityData.durasi)
                newActivity.tips = activityData.tips
                newActivity.disabilityLevel = Int64(activityData.disability_lv)
                newActivity.dementiaLevel = Int64(activityData.dementia_lv)
                newActivity.hobby = activityData.hobby

                // Save the new activity to Core Data
                dataManager.save()
            }
        }
    }
    
//    func getActivity(durasi: Int) -> [Activity]{
//        let request = NSFetchRequest<Activity>(entityName: "Activity")
//
//        let filter = NSPredicate(format: "duration == %i", durasi)
//        request.predicate = filter
//
//        do{
//            activitiesArray = try dataManager.context.fetch(request)
//        }catch let error{
//            print("error fetching core data. \(error.localizedDescription)")
//        }
//        return activitiesArray
//    }
    
    func getActivity() -> [Activity]{
        let request = NSFetchRequest<Activity>(entityName: "Activity")

        do{
            activitiesArray = try dataManager.context.fetch(request)
        }catch let error{
            print("error fetching core data. \(error.localizedDescription)")
        }
        return activitiesArray
    }

    
}

