//
//  ODDController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData


class ODDController{
    
    static var shared = ODDController()
    let dataManager = DataManager.shared
    
    func addODD (demLevel : Int, disLevel: Int, hobbies: [Items]  ) {
        let selectedItemsString = hobbies.map { $0.rawValue }.joined(separator: ", ")
        let newODD = ODD(context: dataManager.context)
        newODD.dementia_lv = Int64(demLevel)
        newODD.disability_lv = Int64(disLevel)
        newODD.hobbies = selectedItemsString
        
        dataManager.save()
    }
    
//    func getODD(){
//        let request = NSFetchRequest<ODD>(entityName: "ODD")
//        do {
//            oddArray = try dataManager.context.fetch(request)
//        }catch {
//            print("DEBUG: Some error occured while fetching")
//        }
//    }
    
}
