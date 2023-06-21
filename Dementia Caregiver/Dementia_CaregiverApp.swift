//
//  Dementia_CaregiverApp.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 20/06/23.
//

import SwiftUI

@main
struct Dementia_CaregiverApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ExampleView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            FormView()
        }
    }
}
