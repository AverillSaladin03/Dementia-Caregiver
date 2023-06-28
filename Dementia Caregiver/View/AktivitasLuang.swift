//
//  AktivitasLuang.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import SwiftUI
import CoreData

let pageDescription = "Aktivitas luang adalah aktivitas apa saja yang dimiliki ODD diluar rutinitas harian ODD seperti makan dan tidur. Aktivitas luang dapat berupa berkebun atau bermain."


struct AktivitasLuang: View {
    
    @State var startTime:Date = Date.now
    @State var endTime:Date = Date.now
    @State var activityCount: Int = 1
    @State private var listSpareTimes: [SpareTime] = listSpareTime
    @State var spareTimeCount: Int = 1
    
//    @StateObject private var spareTimeController: SpareTimeController()
    
    let dateFormatter = DateFormatter()
    
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
                                .font(.body)
                            VStack {
                                DatePicker(
                                    "Mulai",
                                    selection: $listSpareTimes[i].startTime,
                                    displayedComponents: .hourAndMinute
                                )
                                .background(.white)
                                .cornerRadius(12)
                                .labelsHidden()
                                Text("Mulai")
                                    .font(.system(size: 13))
                            }
                            VStack {
                                DatePicker(
                                    "Selesai",
                                    selection: $listSpareTimes[i].endTime,
                                    displayedComponents: .hourAndMinute
                                ).background(.white)
                                    .cornerRadius(12)
                                    .labelsHidden()
                                Text("Selesai")
                                    .font(.system(size: 13))
                            }
                        }
                        .listRowSeparator(.hidden)
                        .padding([.horizontal], 16)
                    }
                    .onDelete(perform: deleteSpareTime)
                    .padding([.vertical], 12)
                    
                    //Button Tambah Aktivitas Luang
                    Button{
                        addSpareTime()
                        submitSpareTime()
                        print("jml list \(listSpareTimes.count)")
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
                .listStyle(.plain)
                
                //Button Submit -> ke dashboard
                NavigationLink(destination: ContentView(listSpareTimes: $listSpareTimes).navigationBarBackButtonHidden(), label: {
                    HStack (alignment: .center){
                        Spacer()
                        
                        Text("Selesai")
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                })
                .frame(height: 41)
                .background(Color("ButtonColor"))
                .foregroundColor(.white)
                .mask {
                    RoundedRectangle(cornerRadius: 8)
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(Text("Aktivitas Luang"))
            .padding(.bottom, 8)
        }
    }
    
    //Fungsi Delete Spare Time
    func deleteSpareTime(at offsets: IndexSet) {
        listSpareTimes.remove(atOffsets: offsets)
    }
    
    //Fungsi Nambah List SpareTime
    func addSpareTime(){
        spareTimeCount += 1
        let newSpareTime = SpareTime(startTime: Date.now, endTime: Date.now, name: "Aktivitas \(spareTimeCount)")
        
        listSpareTimes.append(newSpareTime)
    }
    
    func submitSpareTime(){
        //Input to Core Date
        
        
    }
    
    struct AktivitasLuang_Previews: PreviewProvider {
        static var previews: some View {
            AktivitasLuang()
        }
    }
}
