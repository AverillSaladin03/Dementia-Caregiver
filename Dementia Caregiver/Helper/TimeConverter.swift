//
//  TimeConverter.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 09/07/23.
//

import Foundation

class TimeConverter: ObservableObject{
    
    func timeConversion (start: Date, end: Date, date: Date) -> [Date] {
        
        let calendar = Calendar.current
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let startTimeComponents = calendar.dateComponents([.hour, .minute], from: start)
        let endTimeComponents = calendar.dateComponents([.hour, .minute], from: end)
        
        var startComponent = DateComponents()
        startComponent.year = dateComponents.year
        startComponent.month = dateComponents.month
        startComponent.day = dateComponents.day
        startComponent.hour = startTimeComponents.hour
        startComponent.minute = startTimeComponents.minute
        
        var endComponent = DateComponents()
        endComponent.year = dateComponents.year
        endComponent.month = dateComponents.month
        endComponent.day = dateComponents.day
        endComponent.hour = endTimeComponents.hour
        endComponent.minute = endTimeComponents.minute
        
        let combinedStartTime = calendar.date(from: startComponent)!
        let combinedEndTime = calendar.date(from: endComponent)!
        
        return [combinedStartTime, combinedEndTime]
    }

}
