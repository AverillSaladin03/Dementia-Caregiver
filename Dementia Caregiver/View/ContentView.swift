//
//  ContentView.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .schedule
    @Binding var listSpareTimes:[Spares]
    enum Tab {
        case schedule
        case activity
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ScheduleHome( listSpareTimes: $listSpareTimes)
                .tabItem {
                    Label("Jadwal", systemImage: "calendar")
                }
                .tag(Tab.schedule)
            
            ActivityHome()
                .tabItem {
                    Label("Aktivitas", systemImage: "figure.walk")
                }
                .tag(Tab.activity)
        }
        .tint(Color("ButtonColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(listSpareTimes: .constant(listSpareTime))
    }
}
