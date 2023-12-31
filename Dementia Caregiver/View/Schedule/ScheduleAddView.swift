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
    
    let dateFormatterToTime = DateFormatter()
    @State var formattedEndTime: String = ""
    let calendar = Calendar.current
    
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
                            let showStart = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [0]
                            let showEnd = TimeConverter().timeConversion(start: startTime, end: endTime, date: currentDate) [1]
                            ScheduleController.shared.addManualSchedule(date: currentDate, start: showStart, end: showEnd, activity: selectedActivity!)
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
                
                DatePicker("Tanggal:", selection: $currentDate, in:Date()... , displayedComponents: .date)
                
                Divider()
                DatePicker("Mulai:", selection: $startTime, displayedComponents: .hourAndMinute)
                    .onChange(of: startTime){ _ in
                        endTime = calendar.date(byAdding: .minute, value: Int((selectedActivity?.duration ?? 0)), to: startTime)!
                    }
                //                    .onAppear(){
                //                        UIDatePicker.appearance ().minuteInterval = 5
                //                    }
                
                Divider()
                DatePicker("Berakhir:", selection: $endTime, in:endTime...endTime , displayedComponents: .hourAndMinute)
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
                    }.onChange(of: selectedActivity){ _ in
                        endTime = calendar.date(byAdding: .minute, value: Int((selectedActivity?.duration)!), to: startTime)!
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
