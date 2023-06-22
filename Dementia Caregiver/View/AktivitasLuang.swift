//
//  AktivitasLuang.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 22/06/23.
//

import SwiftUI

let pageDescription = "Aktivitas luang adalah aktivitas apa saja yang dimiliki ODD diluar rutinitas harian ODD seperti makan dan tidur. Aktivitas luang dapat berupa berkebun atau bermain."


struct AktivitasLuang: View {
    
    @State var startTime:Date = Date.now
    @State var endTime:Date = Date.now
    @State var activityCount: Int = 1
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(pageDescription)
                    .font(.system(size: 10))
                    .fontWeight(.light)
                    .padding(.leading, 13)
                    .padding(.trailing, 50)
                    .multilineTextAlignment(TextAlignment.leading)
                Form{
                    ForEach(1...activityCount, id: \.self) { i in
                        HStack (spacing: 20){
                            Text("Aktivitas \(i)")
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                            VStack {
                                DatePicker(
                                    "Mulai",
                                    selection: $startTime,
                                    displayedComponents: .hourAndMinute
                                )
                                .labelsHidden()
                                Text("Mulai")
                                    .font(.system(size: 13))
                            }
                            VStack {
                                DatePicker(
                                    "Selesai",
                                    selection: $endTime,
                                    displayedComponents: .hourAndMinute
                                )
                                .labelsHidden()
                                Text("Selesai")
                                    .font(.system(size: 13))
                            }
                        }
                    }
                    Section {
                        Button{
                            addMoreActivity()
                        }label: {
                            HStack (alignment: .center){
                                Spacer()
                                Text("+ Tambahkan Aktivitas Luang")
                                Spacer()
                            }
                            
                    }
                    }
                }
                
                
            }
            .navigationTitle(Text("Aktivitas Luang"))
        }
    }
    
    func addMoreActivity(){
        activityCount+=1
    }
    
    struct AktivitasLuang_Previews: PreviewProvider {
        static var previews: some View {
            AktivitasLuang()
        }
    }
}
