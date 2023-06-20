//
//  ContentView.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .jadwal
    
    enum Tab {
        case jadwal
        case aktivitas
    }
    
    var body: some View {
        TabView(selection: $selection) {
            JadwalList()
                .tabItem {
                    Label("Jadwal", systemImage: "calendar")
                }
                .tag(Tab.jadwal)
            
            AktivitasHome()
                .tabItem {
                    Label("Aktivitas", systemImage: "figure.walk")
                }
                .tag(Tab.aktivitas)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
