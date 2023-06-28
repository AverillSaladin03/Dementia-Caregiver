//
//  ActivityController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 27/06/23.
//

import Foundation

class ActivityController: ObservableObject{
    static var shared: ActivityController = ActivityController()
    
    var activities: [Activity] = []
    
    init(){
        activities = CoreDataManager.shared.getAllActivity()
    }
    
    func saveActivity() -> Activity {
        let activity = Activity(context: CoreDataManager.shared.viewContext)
    }

    // Ambil Data:
    // ActivityController.shared.activities
    
    //Save Data
}
