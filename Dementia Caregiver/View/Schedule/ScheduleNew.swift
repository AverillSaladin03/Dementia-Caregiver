//
//  ScheduleNew.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleNew: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentDate = Date()
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
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
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack {
                        Text("Aktivitas")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "chevron.forward")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .sheet(isPresented: $showSheet) {
                    ScheduleAdd()
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
        }
        
        
    }
}

struct ScheduleNew_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleNew()
    }
}
