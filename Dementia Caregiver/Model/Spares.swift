//
//  Activity.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import Foundation

struct Spares: Hashable{
    var startTime: Date
    var endTime: Date
    var name: String
}

var listSpareTime: [Spares] = [
    Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas 1")
]
