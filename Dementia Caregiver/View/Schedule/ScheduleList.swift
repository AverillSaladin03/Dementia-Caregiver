//
//  ScheduleList.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleList: View {
    
    @Binding var listSpareTimes: [Spares]
    
    @Environment(\.managedObjectContext) var managedObjectContex
    @FetchRequest(sortDescriptors: [SortDescriptor(\.start, order: .forward)]) var spare: FetchedResults<Spare>
    
    var body: some View {
        List{
            ForEach(spare) { index in
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("BrighterMainColor"))
                        .frame(width: 343, height: 100)
                    
                    HStack(spacing: 10){
                        Image("contoh")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        Spacer()
                        VStack{
                            Text(formatTime(index.start!))
                                .font(.system(size: 11).monospaced())
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1, height: 25)
                            Text(formatTime(index.end!))                                .font(.system(size: 11).monospaced())
                        }
                        Spacer()
                        Text("Bermain Lego lego")
                            .font(.system(size: 17).bold())
                            .padding(.trailing)
                        Spacer()
                        Spacer()
                    }
                    .foregroundColor(.white)
                    //                    .padding(.horizontal)
                }
                .listRowSeparator(.hidden)
                .swipeActions(allowsFullSwipe: false) {
                    Button {
                        print("Muting conversation")
                    } label: {
                        Label("Mute", systemImage: "bell.slash.fill")
                    }
                    .tint(.indigo)
                    
                    Button(role: .destructive) {
                        
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            }
//            .onDelete(perform: deleteSpare)
            .listRowBackground(Color.clear)
            
        }
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(PlainListStyle())
    }
    
    private func formatTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Menetapkan format jam
        
        return formatter.string(from: time)
    }
    
    private func deleteSpare(offsets: IndexSet) {
        withAnimation {
            offsets.map { spare[$0] }
                .forEach(managedObjectContex.delete)
            
            // Saves to our database
            DataManager().save()
        }
    }
    
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList(listSpareTimes: .constant(listSpareTime))
    }
}
