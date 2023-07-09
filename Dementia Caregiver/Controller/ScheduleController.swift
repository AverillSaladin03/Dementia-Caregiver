//
//  ScheduleController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

class ScheduleController: ObservableObject{
    
    static var shared = ScheduleController()
    let dataManager = DataManager.shared
    @Published var scheduleArray: [Schedule] = []
    
    func getSchedule() -> [Schedule] {
        let request = NSFetchRequest<Schedule>(entityName: "Schedule")
        do {
            scheduleArray = try dataManager.context.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
        
        return scheduleArray
    }
    
    func addManualSchedule (date: Date, start: Date, end: Date, activity :Activity) {
        let newSchedule = Schedule(context: dataManager.context)
        
        //Time Conversion
        let startResult = TimeConverter().timeConversion(start: start, end: end, date: date) [0]
        let endResult = TimeConverter().timeConversion(start: start, end: end, date: date) [1]
        
        //Add to Core Data
        newSchedule.id = UUID()
        newSchedule.date = date
        newSchedule.start = startResult
        newSchedule.end = endResult
        newSchedule.addToSchedule_activity(activity)
        
        print ("New Schedule Saved")
        //Save
        dataManager.save()
    }
}
