//
//  SpareTimeController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

class SpareTimeController {
    
    static var shared = SpareTimeController()
    let dataManager = DataManager.shared
    
    func addSpareTime(start: Date, end:Date){
        
//        let calendar = Calendar.current
//
//        // Mengatur komponen tanggal menjadi nol (0)
//        let startComponents = calendar.dateComponents([.hour, .minute], from: start)
//        let startTime = calendar.date(from: startComponents)!
//
//        let endComponents = calendar.dateComponents([.hour, .minute], from: end)
//        let endTime = calendar.date(from: endComponents)!
        
        let spare = Spare(context: dataManager.context)
        spare.id = UUID()
        spare.start = start
        spare.end = end
        spare.name = String()
        //        spare.duration =
        
        dataManager.save()
    }
    
    func getSpareTime() -> [Spare] {
        var spareArray: [Spare] = []
        let request = NSFetchRequest<Spare>(entityName: "Spare")
        do {
            spareArray = try dataManager.context.fetch(request)
        }catch {
            print("DEBUG: Some error occured while fetching")
        }
        
        return spareArray
    }
    
    
}
