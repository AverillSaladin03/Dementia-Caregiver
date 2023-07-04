//
//  ScheduleAdd.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleChooseActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSheet = false
    
    @State private var searchField : String = ""
    @State private var showCancelButton: Bool = false
    let activities = ActivityController2().getActivity()
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button("Kembali") {
                        dismiss()
                    }
                    .foregroundColor(Color("ButtonColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Pilih Aktivitas")
                        .font(.system(size: 17).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button("Selesai") {
                        dismiss()
                    }
                    .foregroundColor(Color("ButtonColor"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom, 32)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search",
                              text: $searchField,
                              onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    },
                              onCommit: {
                        print("onCommit")
                    })
                }
                .background(Color("GrayColor"))
                .padding(.bottom)
                
                List{
                    ForEach (activities, id: \.self) { activity in
                        Text(activity.name ?? "Not Found")
                    }
                }
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack {
                        Text("+ Tambah Aktivitas Baru")
                    }
                    .foregroundColor(Color.white)
                    .padding(.horizontal,32)
                    .padding(.vertical,12)
                    .background(Color("ButtonColor"))
                    .cornerRadius(8)
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
        ScheduleChooseActivityView()
    }
}
