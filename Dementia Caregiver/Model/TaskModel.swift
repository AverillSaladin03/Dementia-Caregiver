//
//  TaskModel.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import Foundation
import SwiftUI

class TaskModel: ObservableObject{
    
    @Published var currentWeek: [Date] = []
    @Published var currentDay: Date = Date()
    
//    var vm = ScheduleController.shared
    
    init() {
        self.fetchCurrentWeek()
    }
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{ return }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func loadData(dateSelect: Date) {
//        //Fetch dari core data yang sesuai dengan dateSelect
//        vm.scheduleArray = []
//
//        //cek data schedule dr core data pd tgl dateselect
//        //kalau gak ada random aktivity
//        //save random ke core data
//        //kalau ada langsung masukin core data ke scheduleArray
//
        
//        var currentSchedule = vm.getSchedule(currentDate: dateSelect)
//        if currentSchedule.isEmpty{
//            vm.addRandomSchedule(selecDate: dateSelect)
//        }
        DispatchQueue.main.asyncAfter(deadline: .now()){
            ScheduleController.shared.getSchedule(forDate: dateSelect)
            print(ScheduleController.shared.scheduleArray)
        }
    }
    
    func extractDate(date:Date, format: String) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
}
