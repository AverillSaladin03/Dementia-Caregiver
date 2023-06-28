//
//  CoreDataManager.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 27/06/23.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func save(){
        do{
            try viewContext.save()
        }catch{
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    static let shared = CoreDataManager()
    private init(){
        persistentContainer = NSPersistentContainer(name: "Dementia_Caregiver")
        persistentContainer.loadPersistentStores{(description, error) in
            if let error = error{
                fatalError("Unable to start core data, \(error)")
            }
        }
    }
    
    func getAllSpare() -> [Spare]{
        let request:NSFetchRequest<Spare> = Spare.fetchRequest()
        do{
            return try viewContext.fetch(request)
        } catch{
            return []
        }
    }
    
    func deleteActivity(activity:Activity){
        viewContext.delete(activity)
        save()
    }
    
    func getActivityById(id: NSManagedObjectID)->Activity?{
        do{
            return try viewContext.existingObject(with: id) as? Activity
        }catch{
            return nil
        }
    }
}
