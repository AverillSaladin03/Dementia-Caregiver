//
//  AktivitasRow.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import SwiftUI

struct AktivitasRow: View {
    var categoryName: String
    var items: [Aktivitas]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { aktivitas in
                        NavigationLink {
                            AktivitasDetail(aktivitas: aktivitas, image: aktivitas.image)
                        } label: {
                            AktivitasItem(aktivitas: aktivitas)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }}

struct AktivitasRow_Previews: PreviewProvider {
    
    static var aktivitas = ModelData().aktivitas
    
    static var previews: some View {
        AktivitasRow(
            categoryName: aktivitas[0].category.rawValue,
            items: Array(aktivitas.prefix(5))
        )
    }
}
