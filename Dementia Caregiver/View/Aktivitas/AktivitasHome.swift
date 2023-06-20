//
//  AktivitasHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import SwiftUI

struct AktivitasHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    AktivitasRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Aktivitas")
        }
    }
}

struct AktivitasHome_Previews: PreviewProvider {
    static var previews: some View {
        AktivitasHome().environmentObject(ModelData())
    }
}
