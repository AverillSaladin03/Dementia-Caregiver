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
    @State private var showSheet = false
    
    @State private var showData = false
    
    @State var selectedActivity : Activity?
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button("Batal") {
                        dismiss()
                    }
                    .foregroundColor(Color("ButtonColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Jadwal Baru")
                        .font(.system(size: 17).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                    if selectedActivity != nil {
                        Button("Tambah") {
                            ScheduleController.shared.addManualSchedule(date: currentDate, start: startTime, end: endTime, activity: selectedActivity!)
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
                
                DatePicker("Tanggal:", selection: $currentDate, displayedComponents: .date)
                Divider()
                DatePicker("Mulai:", selection: $startTime, displayedComponents: .hourAndMinute)
                Divider()
                DatePicker("Berakhir:", selection: $endTime, displayedComponents: .hourAndMinute)
                
                HStack {
                    Text("Aktivitas:")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button {
                        showSheet.toggle()
                    } label: {
                        HStack {
                            if selectedActivity != nil {
                                Text((selectedActivity?.name)!)
                                    .foregroundColor(Color.gray)
                            }else{
                                Text("Pilih Aktivitas")
                                    .foregroundColor(Color.gray)
                            }
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .sheet(isPresented: $showSheet) {
                        ScheduleChooseActivityView(selectedActivity: $selectedActivity)
                            .preferredColorScheme(.light)
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


//struct ScheduleAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScheduleAddView()
//    }
//}
