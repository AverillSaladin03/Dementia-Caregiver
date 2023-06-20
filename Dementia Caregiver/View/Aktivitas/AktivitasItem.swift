//
//  AktivitasItem.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import SwiftUI

struct AktivitasItem: View {
    var aktivitas: Aktivitas
    
    var body: some View {
        VStack(alignment: .leading) {
            aktivitas.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(aktivitas.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct AktivitasItem_Previews: PreviewProvider {
    static var previews: some View {
        AktivitasItem(aktivitas: ModelData().aktivitas[0])
    }
}
