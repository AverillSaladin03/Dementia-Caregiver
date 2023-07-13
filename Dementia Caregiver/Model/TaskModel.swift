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
//        calendar.locale = Locale(identifier: "id_ID")
//        calendar.timeZone = TimeZone(identifier: TimeZone.current.identifier)!
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{ return }
        
        (0...6).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
                print(weekday)
                
                if Calendar.current.isDate(currentDay, equalTo: weekday, toGranularity: .day) {
                    currentDay = weekday
                }
            }
        }
    }
    
    func loadData(dateSelect: Date) {
//        DispatchQueue.main.asyncAfter(deadline: .now()){
            ScheduleController.shared.getSchedule(forDate: dateSelect)
            print(ScheduleController.shared.scheduleArray)
//        }
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
