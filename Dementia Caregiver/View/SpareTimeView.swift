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
                            VStack {
                                DatePicker(
                                    "Tes",
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
                    //                                            .onDelete { indexSet in
                    //                                                listSpareTimes.remove(atOffsets: indexSet)
                    //                                            }
                    .padding([.vertical], 12)
                    .background(Color("GrayColor"))
                    .mask(RoundedRectangle(cornerRadius: 8))
                    //                    .padding(.bottom)
                    
                    
                    //Button Tambah Aktivitas Luang
                    Button{
                        addSpareTime()
                        //                        submitSpareTime()
                        //                        print("jml list \(listSpareTimes.count)")
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
                
                Button{
                    submitSpareTime()
                }label:{
                    NavigationLink(destination: ContentView(listSpareTimes: $listSpareTimes).navigationBarBackButtonHidden(), isActive: $isSaved) {
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
                }
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
        let newSpareTime = Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas \(spareTimeCount)")
        
        listSpareTimes.append(newSpareTime)
    }
    
    func submitSpareTime(){
        for i in listSpareTimes{
            SpareTimeController().addSpareTime(start: i.startTime, end: i.endTime)
            print ("\(i.startTime)")
            print ("\(i.endTime)")
        }
        isSaved = true
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
    
    struct AktivitasLuang_Previews: PreviewProvider {
        static var previews: some View {
            SpareTimeView()
        }
    }
}
