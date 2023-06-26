//
//  ScheduleAdd.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleAdd: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button("Kembali") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Pilih Aktivitas")
                        .font(.system(size: 17).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                    Button("Selesai") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom, 45)
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Tambah Aktivitas Baru")
                    }
                    .foregroundColor(Color.white)
                    .padding(.horizontal,35)
                    .padding(.vertical,15)
                    .background(Color.blue)
                    .cornerRadius(15)
                }
                .sheet(isPresented: $showSheet) {
                    ScheduleAddManual()
                }
                
                Spacer()
            }
            .padding()
        }
        
        
    }
}

struct ScheduleAdd_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleAdd()
    }
}
