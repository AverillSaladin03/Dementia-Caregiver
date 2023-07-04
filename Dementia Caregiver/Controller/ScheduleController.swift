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

    func addManualSchedule (start: Date, end: Date, activity :Activity) {
        let newSchedule = Schedule(context: dataManager.context)
        newSchedule.id = UUID()
        newSchedule.start = start
        newSchedule.end = end
        
        newSchedule.addToSchedule_activity(activity)
        dataManager.save()
}
