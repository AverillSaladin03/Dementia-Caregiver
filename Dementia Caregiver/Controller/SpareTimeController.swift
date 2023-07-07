//
//  SpareTimeController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

struct Spares: Hashable{
    var startTime: Date
    var endTime: Date
    var name: String
}

var listSpareTime: [Spares] = [
    Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas 1")
]

class SpareTimeController {
    
    let dataManager = DataManager.shared
    
    func addSpareTime(start: Date, end:Date){
        let spare = Spare(context: dataManager.context)
        spare.id = UUID()
        spare.start = start
        spare.end = end
        spare.name = String()
        spare.duration = minutesBetweenDates(start, end) + 1
        dataManager.save()
        
        print(minutesBetweenDates(start, end))
        
    }
    
    func minutesBetweenDates(_ oldDate: Date, _ newDate: Date) -> Int64 {

        //get both times sinces refrenced date and divide by 60 to get minutes
        let newDateMinutes = newDate.timeIntervalSinceReferenceDate/60
        let oldDateMinutes = oldDate.timeIntervalSinceReferenceDate/60
        let interval = Int64((newDateMinutes - oldDateMinutes))
        //then return the difference
        return interval
    }
    
    func addSpareTimetoSchedule(){
        
    }
}
