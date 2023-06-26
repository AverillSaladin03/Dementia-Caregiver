//
//  ScheduleList.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleList: View {
    
    @Binding var listSpareTimes: [Spares]
    
    var body: some View {
        ForEach(listSpareTimes.indices, id: \.self) { index in
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("BrighterMainColor"))
                    .frame(width: 343, height: 100)
                
                HStack(spacing: 10){
                    Image("contoh")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .padding(.leading, 9)
                    Spacer()
                    VStack{
                        Text(formatTime(listSpareTimes[index].startTime))
                            .font(.system(size: 11).monospaced())
                        Rectangle()
                            .fill(.white)
                            .frame(width: 1, height: 25)
                        Text(formatTime(listSpareTimes[index].endTime))
                            .font(.system(size: 11).monospaced())
                    }
                    Spacer()
                    Text("Bermain Lego lego")
                        .font(.system(size: 17).bold())
                        .padding(.trailing)
                    Spacer()
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(.horizontal)
            }
        }
    }
    
    func formatTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Menetapkan format jam
        
        return formatter.string(from: time)
    }
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList(listSpareTimes: .constant(listSpareTime))
    }
}
