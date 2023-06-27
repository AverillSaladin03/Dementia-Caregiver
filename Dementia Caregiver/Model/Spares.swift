//
//  Activity.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import Foundation

struct Spares: Hashable, Identifiable{
    var id = UUID().uuidString
    var startTime: Date
    var endTime: Date
    var name: String
    var offset: CGFloat
    var isSwiped: Bool
}

class CardViewModel: ObservableObject {
    @Published var listSpareTime: [Spares] = [
        Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas 1", offset: 0, isSwiped: false)
    ]
}
