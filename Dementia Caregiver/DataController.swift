//
//  DataController.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 27/06/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Dementia_Caregiver")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func save(contex: NSManagedObjectContext){
        do{
            try contex.save()
            print("data saved")
        } catch{
            print("we couldn't save the data")
        }
    }
    
    func addActivityLuang(start: Date, end:Date, contex: NSManagedObjectContext){
        let spare = Spare(context: contex)
        spare.id = UUID()
        spare.start = start
        spare.end = end
        spare.name = String()
        
        save(contex: contex)
    }
    
}
