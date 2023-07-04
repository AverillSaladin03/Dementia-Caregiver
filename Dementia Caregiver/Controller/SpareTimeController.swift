//
//  SpareTimeController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData

class SpareTimeController {
    
    let dataManager = DataManager.shared
    
    func addActivityLuang(start: Date, end:Date){
        let spare = Spare(context: dataManager.context)
        spare.id = UUID()
        spare.start = start
        spare.end = end
        spare.name = String()
        spare.duration = Int16()
        
        dataManager.save()
    }
    
}
