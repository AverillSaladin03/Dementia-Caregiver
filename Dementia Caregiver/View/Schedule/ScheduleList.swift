//
//  ScheduleList.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleList: View {
    
    //    @Binding var spareTime: Spares
    //    @Binding var listSpareTimes: [Spares]
    @ObservedObject var cardView: CardViewModel
    
    var body: some View {
        ForEach(Array(cardView.listSpareTime.indices), id: \.self) { index in
            ZStack {
                LinearGradient (gradient: .init(colors: [Color.blue.opacity(0.5),Color.blue]), startPoint: .leading, endPoint: .trailing)
                
                //Delete Button
                HStack{
                    Spacer()
                    
                    Button(action:{
                        withAnimation(.easeOut){deleteItem()}
                        
                    }) {
                        Image (systemName: "trash")
                            .font (.title)
                            .foregroundColor (.white)
                            .frame (width: 90, height: 50)
                    }
                }
                
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
                            Text(formatTime(cardView.listSpareTime[index].startTime))
                                .font(.system(size: 11).monospaced())
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1, height: 25)
                            Text(formatTime(cardView.listSpareTime[index].endTime))
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
                
                .contentShape(Rectangle())
                .offset(x: cardView.listSpareTime[index].offset)
                .gesture(DragGesture()
                    .onChanged(onChanged(value: ))
                    .onEnded(onEnd(value: ))
                )
                
            }
            
        }
    }
    
    func formatTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Menetapkan format jam
        
        return formatter.string(from: time)
    }
    
    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if let index = cardView.listSpareTime.firstIndex(where: { $0.isSwiped }) {
                cardView.listSpareTime[index].offset = value.translation.width
            } else {
                // Tidak ada elemen yang memenuhi kondisi isSwiped
                // Lakukan tindakan lain atau berikan logika yang sesuai
            }
        }
    }
    
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if let index = cardView.listSpareTime.firstIndex(where: { $0.isSwiped }) {
                    if -value.translation.width > UIScreen.main.bounds.width / 2 {
                        cardView.listSpareTime[index].offset = -1000
                        deleteItem() // Menghapus elemen pada indeks yang ditemukan
                    } else if -cardView.listSpareTime[index].offset > 50 {
                        cardView.listSpareTime[index].isSwiped = true
                        cardView.listSpareTime[index].offset = -90
                    } else {
                        cardView.listSpareTime[index].isSwiped = false
                        cardView.listSpareTime[index].offset = 0
                    }
                }
            } else {
                for index in cardView.listSpareTime.indices {
                    cardView.listSpareTime[index].isSwiped = false
                    cardView.listSpareTime[index].offset = 0
                }
            }
        }
    }
    
    
    //removing item
    func deleteItem(){
        cardView.listSpareTime.removeAll{ (item) -> Bool in
            return self.cardView.listSpareTime.first!.id == item.id
        }
    }
    
    
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        let cardView = CardViewModel() // Buat instance CardViewModel
        
        return ScheduleList(cardView: cardView)
            .environmentObject(cardView) // Berikan environment object jika diperlukan
    }
}
