//
//  ScheduleList.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleList: View {
    
    //    @Binding var listSpareTimes: [Spares]
    
    @Environment(\.managedObjectContext) var managedObjectContex
    //    @FetchRequest(sortDescriptors: [SortDescriptor(\.start, order: .forward)]) var spare: FetchedResults<Spare>
    
    @StateObject var vm = ScheduleController.shared
        
    @State var selectedSchedule: Schedule? = nil
    
    var body: some View {
        NavigationStack{
            List{
                //            ForEach(vm.scheduleArray) { index in
                ForEach(Array(vm.scheduleArray.enumerated()), id: \.offset) { offset, item in
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
                                Text(formatTime(item.start!))
                                    .font(.system(size: 11).monospaced())
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1, height: 25)
                                Text(formatTime(item.end!))
                                    .font(.system(size: 11).monospaced())

                            }
                            Spacer()
                            Text((item.schedule_activity?.name) ?? "")
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
                            self.selectedSchedule = item
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.indigo)
                        
                        Button(role: .destructive) {
                            deleteSpareIndex(i: offset)
                        } label: {
                            Label("Hapus", systemImage: "trash.fill")
                        }
                    }
                }
                //            .onDelete(perform: deleteSpare)
                .listRowBackground(Color.clear)
                
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            .sheet(item: $selectedSchedule, onDismiss: {
                vm.getSchedule(forDate: selectedSchedule?.date ?? Date.now)
            }) { item in
                ScheduleEditView(schedule: item)
            }

            
            
//            NavigationLink(destination: ScheduleEditView(), isActive: $isShowEdit) {
//                EmptyView()
//            }

        }
    }
    
    private func formatTime(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm" // Menetapkan format jam
        
        return formatter.string(from: time)
    }
    
    func deleteSpareIndex(i: Int){
        managedObjectContex.delete(vm.scheduleArray[i])
        vm.scheduleArray.remove(at: i)
        DataManager.shared.save()
    }
    
    //    func deleteSpareIndex(schedule: Schedule) {
    //        if let index = vm.scheduleArray.firstIndex(of: schedule) {
    //            managedObjectContex.delete(vm.scheduleArray[index])
    //            DataManager.shared.save()
    //        }
    //    }
    
    
    //    private func deleteSpare(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { vm.scheduleArray[$0] }
    //                .forEach(managedObjectContex.delete)
    //
    //            // Saves to our database
    //            DataManager.shared.save()
    //        }
    //    }
    
}


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
