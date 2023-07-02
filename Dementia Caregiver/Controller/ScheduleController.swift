//
//  ScheduleController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

class ScheduleController{
    let dataManager = DataManager.shared
    
    func addManualSchedule (start: Date, end: Date, activity :Activity) {
        let newSchedule = Schedule(context: dataManager.context)
        newSchedule.id = UUID()
        newSchedule.start = start
        newSchedule.end = end
        
        newSchedule.addToSchedule_activity(activity)
        dataManager.save()
    }
    
}
