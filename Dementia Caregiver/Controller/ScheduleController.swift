//
//  ScheduleController.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 28/06/23.
//

import Foundation
import CoreData
import SwiftUI

class ScheduleController: ObservableObject{
    
    static var shared = ScheduleController()
    let dataManager = DataManager.shared
    @Published var scheduleArray: [Schedule] = []
    
    //    init(){
    //
    //        getSchedule()
    //
    //    }
    //
    //        func getSchedule(){
    //            let request = NSFetchRequest<Schedule>(entityName: "Schedule")
    //
    //            do {
    //                scheduleArray = try dataManager.context.fetch(request)
    //            }catch {
    //                print("DEBUG: Some error occured while fetching")
    //            }
    //        }
    
    //    func getSchedule(currentDate: Date)->[Schedule]{
    //        let request = NSFetchRequest<Schedule>(entityName: "Schedule")
    //
    //        let filter = NSPredicate(format: "date == %@", currentDate as NSDate)
    //        request.predicate = filter
    //
    //        do {
    //            scheduleArray = try dataManager.context.fetch(request)
    //            return scheduleArray
    //        }catch {
    //            print("DEBUG: Some error occured while fetching")
    //        }
    //        return []
    //    }
    
    func getSchedule(forDate date: Date) {
        let request = NSFetchRequest<Schedule>(entityName: "Schedule")
        
        let sort = NSSortDescriptor(keyPath: \Schedule.start, ascending: true)
        request.sortDescriptors = [sort]
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: date)
        let tommorow = calendar.date(byAdding: .day, value: 1, to: date)!
        
        let filterKey = "date"
        
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray:
        [today, tommorow])
        request.predicate = predicate
        
        do {
            scheduleArray = try dataManager.context.fetch(request)
        } catch {
            print("DEBUG: Some error occurred while fetching")
        }
    }

    
    //1. get spare
    //    let getSpare = SpareTimeController.shared.getSpareTime()
    
    //2. get + filter durasi
    let activityController = ActivityController2()
    
    
    //3. masukin schedule
    //    func addSchedule(){
    //
    //        for spare in getSpare{
    //            let schedule = Schedule(context: dataManager.context)
    //            schedule.id = UUID()
    //            schedule.start = spare.start
    //            schedule.end = spare.end
    //
    //            let randomActivity: Activity?
    //
    //            // Cek apakah tanggal spare sama dengan hari ini
    //            if TaskModel().isToday(date: spare.date) {
    //                // Jika sama, ambil elemen acak dari aktivitas
    //                randomActivity = activityController.getActivity(durasi: Int(spare.duration)).randomElement()
    //            } else {
    //                // Jika berbeda, beri nilai nil pada elemen acak
    //                randomActivity = nil
    //            }
    //
    //            schedule.schedule_activity = randomActivity
    //
    //            dataManager.save()
    //        }
    //    }
    
    //    func addSchedule(){
    //
    //        for spare in getSpare{
    //            let schedule = Schedule(context: dataManager.context)
    //            schedule.id = UUID()
    //            schedule.start = spare.start
    //            schedule.end = spare.end
    //            schedule.date = Date.now
    //            schedule.schedule_activity = activityController.getActivity().randomElement()
    //
    //            dataManager.save()
    //        }
    //    }
    //    //
    //    func addRandomSchedule(selecDate: Date){
    //        for _ in getSpare{
    //            let schedule = Schedule(context: dataManager.context)
    //            schedule.date = selecDate
    //            schedule.schedule_activity = activityController.getActivity().randomElement()
    //
    //            dataManager.save()
    //        }
    //    }
    
    //        func addSchedule(){
    //
    //            for spare in getSpare{
    //                var scheduleUsed:[Activity] = []
    //
    //                let schedule = Schedule(context: dataManager.context)
    //                schedule.id = UUID()
    //                schedule.start = spare.start
    //                schedule.end = spare.end
    //                if scheduleUsed.isEmpty{
    //                    schedule.schedule_activity = activityController.getActivity().randomElement()
    //                    if let activity = schedule.schedule_activity {
    //                        scheduleUsed.append(activity)
    //                    }
    //                } else{
    //                    var randomActivity: Activity?
    //
    //                    repeat {
    //                        randomActivity = activityController.getActivity().randomElement()
    //                    } while randomActivity != nil && scheduleUsed.contains(randomActivity!)
    //
    //                    schedule.schedule_activity = randomActivity
    //                    if let activity = randomActivity {
    //                        scheduleUsed.append(activity)
    //                    }
    //                }
    //
    //                dataManager.save()
    //            }
    //        }
    
    
    /*
     Langkah untuk buat schedule:
     1. getCurrentWeek
     2. getSpare
     3. Looping CurrentWeek
     4. Looping Spare
     5. GetRandomActivity
     6. GetSchedule untuk tanggal di looping saat ini dan kemarin
     7. Cek apakah activity dari langkah 6 sama dengan hasil langkah 5
     -- kalau sama, ulang langkah 5
     -- kalah tidak sama, addSchedule
     
     
     */
    
    let getCurrentWeek = TaskModel().currentWeek
    let getSpare = SpareTimeController.shared.getSpareTime()
    //
    func randomSchedule(){
        for date in getCurrentWeek{
            for spareSchedule in getSpare {
                let startResult = TimeConverter().timeConversion(start: spareSchedule.start!, end: spareSchedule.end!, date: date) [0]
                let endResult = TimeConverter().timeConversion(start: spareSchedule.start!, end: spareSchedule.end!, date: date) [1]
                let schedule = Schedule(context: dataManager.context)
                schedule.id = UUID()

                let showStart = TimeConverter().timeConversion(start: spareSchedule.start!, end: spareSchedule.end!, date: date) [0]
                let showEnd = TimeConverter().timeConversion(start: spareSchedule.start!, end: spareSchedule.end!, date: date) [1]
                schedule.start = showStart
                schedule.end = showEnd
                schedule.date = date
                
                var randomActivity: Activity?
                
                
                repeat {
                    randomActivity = activityController.getActivity().randomElement()
                } while !checkActivitySchedule(forDate: date, newActivity: randomActivity ?? activityController.getActivity()[0])
                
                schedule.schedule_activity = randomActivity
                dataManager.save()
            }
        }
    }
    
//    func subtractOneDayFromDate(_ date: Date) -> Date? {
//        let calendar = Calendar.current
//        let oneDayAgo = calendar.date(byAdding: .day, value: -1, to: date)
//        return oneDayAgo
//    }
    
    func checkActivitySchedule(forDate date: Date, newActivity: Activity) -> Bool {
        var previousSchedule: [Schedule] = []
        let request = NSFetchRequest<Schedule>(entityName: "Schedule")
        
//        let yesterday = subtractOneDayFromDate(date)
//
//        let predicate = NSPredicate(format: "date == %@ OR date == %@ ", yesterday! as CVarArg, date as CVarArg)
//        request.predicate = predicate
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: date)
        let yesterday = calendar.date(byAdding: .day, value: -1, to: date)!
        
        let filterKey = "date"
        
        let predicate = NSPredicate(format: "\(filterKey) == %@ AND \(filterKey) == %@", argumentArray:
        [yesterday, today])
        request.predicate = predicate
        
        do {
            previousSchedule = try dataManager.context.fetch(request)
        } catch {
            print("DEBUG: Some error occurred while fetching")
        }
        
        if previousSchedule.contains(where: { $0.schedule_activity == newActivity }){
            return false
        } else {
            return true
        }
    }
    
    
    func addManualSchedule (date: Date, start: Date, end: Date, activity: Activity) {
        //        print("act: \(activity.name)")
        let newSchedule = Schedule(context: dataManager.context)
        
        //Time Conversion
        //        let startResult = TimeConverter().timeConversion(start: start, end: end, date: date) [0]
        //        let endResult = TimeConverter().timeConversion(start: start, end: end, date: date) [1]
        
        //Add to Core Data
        newSchedule.id = UUID()
        newSchedule.date = date
        newSchedule.start = start
        newSchedule.end = end
        newSchedule.schedule_activity = activity
        //        print("newdate:\(date)")
        dataManager.save()
        
        //        getSchedule(forDate: date)
        //        print(scheduleArray.count)
    }
    
    func editSchedule(editSchedule: Schedule, date: Date, start: Date, end: Date, activity: Activity){
        editSchedule.date = date
        editSchedule.start = start
        editSchedule.end = end
        editSchedule.schedule_activity = activity
        
        dataManager.save()
    }
    
}
