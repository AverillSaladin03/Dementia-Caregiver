//
//  ScheduleNew.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleAddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var selectedActivity = Activity()
    @State private var showSheet = false
    
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    
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
                DatePicker("Mulai:", selection: $startTime, displayedComponents: .hourAndMinute)
                Divider()
                DatePicker("Berakhir:", selection: $endTime, displayedComponents: .hourAndMinute)
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack {
                        Text("Aktivitas")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Picker(selection: $selectedActivity, label: Text("")){
                            ForEach(frameworks, id: \.self) { activity in
                                Text(activity)
                            }
                            NavigationLink(destination: SpareTimeView().navigationBarBackButtonHidden()) {
                                Text("Tambah Aktivitas")
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .sheet(isPresented: $showSheet) {
                    ScheduleChooseActivityView()
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
        }
    }
}

func addNewSchedule (){
    
}

struct ScheduleAddView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleAddView()
    }
}
