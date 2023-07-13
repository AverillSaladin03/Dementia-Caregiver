//
//  Dementia_CaregiverApp.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 20/06/23.
//

import SwiftUI

@main
struct Dementia_CaregiverApp: App {
    @StateObject private var dataManager = DataManager.shared
    
    var body: some Scene {
        WindowGroup {
//           ScheduleAddView()
//            ContentView()

//            FormView()
            OnBoardingView()

                .environment(\.colorScheme, .light)
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
