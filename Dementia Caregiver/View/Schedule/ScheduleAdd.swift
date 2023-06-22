//
//  ScheduleAdd.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleAdd: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentDate = Date()
    
    var body: some View {
        VStack{
            HStack{
                Button("Batal") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("Aktivitas Baru")
                    .font(.system(size: 17).bold())
                    .frame(maxWidth: .infinity, alignment: .center)
                Button("Tambah") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.bottom, 45)
                        
            DatePicker("Tanggal:", selection: $currentDate, displayedComponents: .date)
            Divider()
            DatePicker("Mulai:", selection: $currentDate, displayedComponents: .hourAndMinute)
            Divider()
            DatePicker("Berakhir:", selection: $currentDate, displayedComponents: .hourAndMinute)
            
            Text("Aktivitas")
                .padding(.top, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding()

        
    }
}

struct ScheduleAdd_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleAdd()
    }
}
