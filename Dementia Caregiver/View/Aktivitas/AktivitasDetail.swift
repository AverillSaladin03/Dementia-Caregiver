//
//  AktivitasDetail.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import SwiftUI

struct AktivitasDetail: View {
    
    var aktivitas: Aktivitas
    var image:Image
    
    var body: some View {
        VStack{
            image
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 400, height: 200)
        }
    }
}

struct AktivitasDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        AktivitasDetail(aktivitas: modelData.aktivitas[0], image: Image("turtlerock"))
    }
}
