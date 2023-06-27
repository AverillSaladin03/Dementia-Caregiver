//
//  AktivitasLuang.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import SwiftUI

let pageDescription = "Aktivitas luang adalah aktivitas apa saja yang dimiliki ODD diluar rutinitas harian ODD seperti makan dan tidur. Aktivitas luang dapat berupa berkebun atau bermain."


struct AktivitasLuang: View {
    
//    @State var startTime:Date = Date.now
//    @State var endTime:Date = Date.now
    @State var activityCount: Int = 1
//    @State private var listSpareTimes: [Spares] = listSpareTime

    @StateObject var cardData = CardViewModel()
    @State var spareTimeCount: Int = 1
    
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
                    ScrollView {
                        ForEach(Array(cardData.listSpareTime.indices), id: \.self) { i in
                            HStack (spacing: 20){
                                Text("\(cardData.listSpareTime[i].name)")
                                    .fontWeight(.bold)
                                    .font(.system(size: 17))
                                VStack {
                                    DatePicker(
                                        "Tes",
                                        selection: $cardData.listSpareTime[i].startTime,
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
                                        selection: $cardData.listSpareTime[i].endTime,
                                        displayedComponents: .hourAndMinute
                                    ).background(.white)
                                        .cornerRadius(12)
                                        .labelsHidden()
                                    Text("Selesai")
                                        .font(.system(size: 13))
                                }
                            }
                            .padding([.horizontal], 16)
                        }
                        .padding([.vertical], 12)
                        .background(Color("GreyColor"))
                        .mask(RoundedRectangle(cornerRadius: 8))
                        .padding(.bottom)
                        
                        //Button Tambah Aktivitas Luang
                        Button{
                            addSpareTime()
                            submitSpareTime()

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
                    }
                    .padding(.vertical)
                }
                .padding(.vertical)
                
                //Button Submit -> ke dashboard
                NavigationLink(destination: ContentView(cardView: cardData).navigationBarBackButtonHidden(), label: {
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
    
    //Fungsi Delete Spare Time
//    func deleteSpareTime(at offsets: IndexSet) {
//        listSpareTimes.remove(atOffsets: offsets)
//    }
    
    //Fungsi Nambah List SpareTime
    func addSpareTime(){
        spareTimeCount += 1
        let newSpareTime = Spares(startTime: Date.now, endTime: Date.now, name: "Aktivitas \(spareTimeCount)", offset: 0, isSwiped: false)
        
        cardData.listSpareTime.append(newSpareTime)
    }
    
    func submitSpareTime(){
        VStack{
            Text("Activities : \(activityCount)")
            Text("List Spare Time : ")
            ForEach(cardData.listSpareTime, id: \.self) { i in
                Text ("Nama: \(i.name)")
                Text ("Start: \(i.startTime)")
                Text ("End: \(i.endTime)")
            }
        }
        
    }
    
    struct AktivitasLuang_Previews: PreviewProvider {
        static var previews: some View {
            AktivitasLuang()
        }
    }
}
