//
//  ScheduleEditView.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 11/07/23.
//

import SwiftUI

struct ScheduleEditView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var showSheet = false
    
    @State private var showData = false
    
    @State var selectedActivity : Activity?
    
    var schedule: FetchedResults<Schedule>.Element
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button("Batal") {
                        dismiss()
                    }
                    .foregroundColor(Color("ButtonColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Edit Jadwal")
                        .font(.system(size: 17).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                    if selectedActivity != nil {
                        Button("Selesai") {
                            let showStart = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [0]
                            let showEnd = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [1]
                            ScheduleController.shared.editSchedule(editSchedule: schedule, date: currentDate, start: showStart, end: showEnd, activity: selectedActivity!)
                            dismiss()
                        }
                        .foregroundColor(Color("ButtonColor"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }else{
                        Text("Tambah")
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                }
                .padding(.bottom, 45)
                .onAppear{
                    currentDate = schedule.date!
                    startTime = schedule.start!
                    endTime = schedule.end!
                    selectedActivity = schedule.schedule_activity
//
//                    currentDate = schedule.date ?? Date.now
//                    startTime = schedule.start ?? Date.now
//                    endTime = schedule.end ?? Date.now
//                    selectedActivity = schedule.schedule_activity
                }
                
                DatePicker("Tanggal:", selection: $currentDate, displayedComponents: .date)
                Divider()
                DatePicker("Mulai:", selection: $startTime, displayedComponents: .hourAndMinute)
                Divider()
                DatePicker("Berakhir:", selection: $endTime, displayedComponents: .hourAndMinute)
                
                HStack {
                    Text("Aktivitas")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        showSheet.toggle()
                    } label: {
                        HStack {
                            Text((selectedActivity?.name) ?? "")
                                .foregroundColor(Color.gray)
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .sheet(isPresented: $showSheet) {
                        ScheduleChooseActivityView(selectedActivity: $selectedActivity)
                    }
                    
                }
                .padding(.top, 30)
                
                Spacer()
                //                Button{
                //                    showData = true
                //                }label: {
                //                    Text("Show")
                //                }
                //                if showData {
                //                    let showStart = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [0]
                //                    let showEnd = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [1]
                //
                //                    Text("Selected Date : \(currentDate)")
                //                    Text("Start Time : \(showStart)")
                //                    Text("End Time : \(showEnd)")
                //                    Text("Selected Activity : \((selectedActivity?.name)!)")
                //                }
            }
            .padding()
        }
    }
}
