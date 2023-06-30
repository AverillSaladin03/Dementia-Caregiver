//
//  ODDController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData


class ODDController{
    let dataManager = DataManager().shared
    
    func addODD (date: Date, demLevel : Int, disLevel: Int, hobbies: [Items]  ) {
        let selectedItemsString = hobbies.map { $0.rawValue }.joined(separator: ", ")
        let newODD = ODD(context: dataManager.context)
        newODD.birth_date = date
        newODD.dementia_lv = Int64(demLevel)
        newODD.disability_lv = Int64(disLevel)
        newODD.hobbies = selectedItemsString
        
        dataManager.save()
    }
    
}
