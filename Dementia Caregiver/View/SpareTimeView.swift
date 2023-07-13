//
//  AktivitasLuang.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import SwiftUI

let pageDescription = "Aktivitas luang adalah aktivitas apa saja yang dimiliki ODD diluar rutinitas harian ODD seperti makan dan tidur. Aktivitas luang dapat berupa berkebun atau bermain."


struct SpareTimeView: View {
    @Environment(\.managedObjectContext) var managedObjectContex
    
    @State var activityCount: Int = 1
    @State private var listSpareTimes: [Spares] = listSpareTime
    @State var spareTimeCount: Int = 1
    @State var isSaved = false
    
    @AppStorage("userFlag") var isNewDownloaded = false
    let dateFormatter = DateFormatter()
    
    let newActivityContoller = ActivityController2()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(pageDescription)
                    .font(.system(size: 13))
                    .fontWeight(.light)
                    .padding(.leading, 13)
                    .padding(.trailing, 50)
                    .multilineTextAlignment(TextAlignment.leading)
                
                //Scroll with For Loop Activities
                List {
                    ForEach(listSpareTimes.indices, id: \.self) { i in
                        HStack (spacing: 20){
                            Text(listSpareTimes[i].name)
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                            Spacer()
                            VStack {
                                DatePicker(
                                    "Mulai",
                                    selection: $listSpareTimes[i].startTime,
                                    displayedComponents: .hourAndMinute
                                )
                                .background(.white)
                                .cornerRadius(12)
                                .labelsHidden()
                                .onAppear(){
                                    UIDatePicker.appearance ().minuteInterval = 5
                                }
                                
                                Text("Mulai")
                                    .font(.system(size: 13))
                            }
                            VStack {
                                DatePicker(
                                    "Selesai",
                                    selection: $listSpareTimes[i].endTime,
                                    in: listSpareTimes[i].startTime...,
                                    displayedComponents: .hourAndMinute
                                )
                                .background(.white)
                                .cornerRadius(12)
                                .labelsHidden()
                                .onAppear(){
                                    UIDatePicker.appearance ().minuteInterval = 5
                                }
                                
                                Text("Selesai")
                                    .font(.system(size: 13))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.horizontal], 16)
                        .listRowSeparator(.hidden)
                        .swipeActions(allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                listSpareTimes.remove(at: i)
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                        
                    }
                    .padding([.vertical], 12)
                    .background(Color("GrayColor"))
                    .mask(RoundedRectangle(cornerRadius: 8))
                    
                    
                    //Button Tambah Aktivitas Luang
                    Button{
                        addSpareTime()
                    }label: {
                        HStack (alignment: .center){
                            Spacer()
                            Text("+ Tambahkan Aktivitas Luang")
                                .foregroundColor(Color("ButtonColor"))
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                            Spacer()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .padding(.vertical)
                .listStyle(PlainListStyle())
                
                if (listSpareTimes.count != 0) {
                    Button{
                        submitSpareTime()
                    }label:{
                        Spacer()
                        Text("Selesai")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .frame(height: 41)
                    .background(Color("ButtonColor"))
                    .foregroundColor(.white)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                    .padding(.horizontal, 18)
                    
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(), isActive: $isSaved) {
                    }
                    .navigationTitle(Text("Aktivitas Luang"))
                    .navigationBarTitleDisplayMode(.large)
                    .padding(.bottom, 8)
                } else {
                    HStack (alignment: .center){
                        Spacer()

                        Text("Selesai")
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .frame(height: 41)
                    .background(.gray)
                    .foregroundColor(.white)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                }
            }
        }
    }
    
    //Fungsi Delete Spare Time
    func deleteSpareTime(at offsets: IndexSet) {
        listSpareTimes.remove(atOffsets: offsets)
    }
    
    //Fungsi Nambah List SpareTime
    func addSpareTime(){
        spareTimeCount += 1
        let newSpareTime = Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas \(spareTimeCount)")
        
        listSpareTimes.append(newSpareTime)
    }
    
    func submitSpareTime(){
        isNewDownloaded = false
        for i in listSpareTimes{
            SpareTimeController.shared.addSpareTime(start: i.startTime, end: i.endTime)
            print ("\(i.startTime)")
            print ("\(i.endTime)")
        }
        isSaved = true
        ScheduleController.shared.randomSchedule()
        
    }
    
    struct AktivitasLuang_Previews: PreviewProvider {
        static var previews: some View {
            SpareTimeView()
        }
    }
}
