//
//  DataController.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 27/06/23.
//

import Foundation
import CoreData

class DataManager: ObservableObject{
    static let shared = DataManager()
    let container = NSPersistentContainer(name: "Dementia_Caregiver")
    let context: NSManagedObjectContext
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
        
        context = container.viewContext
    }
    
    func save(){
        do{
            try context.save()
            print("data \(context.name ?? "") saved")
        } catch{
            print("we couldn't save the data")
        }
    }
}
