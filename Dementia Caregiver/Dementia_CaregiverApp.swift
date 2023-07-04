//
//  Dementia_CaregiverApp.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 20/06/23.
//

import SwiftUI

@main
struct Dementia_CaregiverApp: App {
    @StateObject private var dataController = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
            SpareTimeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                
        }
    }
}
