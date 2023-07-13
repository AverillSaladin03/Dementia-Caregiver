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
    
    @StateObject var vm = ScheduleController.shared
    
    @State var selectedSchedule: Schedule? = nil
    //    @State var isShowEdit: Bool = false
    @State var selectedDate: Date = Date()
    
    var body: some View {
        
        if vm.scheduleArray.isEmpty{
            VStack(alignment: .center){
                Image("empty view")
                    .resizable()
                    .frame(width: 250, height: 300)
                    .padding(.bottom)
                
                Text("Tidak ada aktivitas!")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                
            }
        }
        
        NavigationStack{
            List{
                //            ForEach(vm.scheduleArray) { index in
                ForEach(Array(vm.scheduleArray.enumerated()), id: \.offset) { offset, item in
                    ZStack {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                            //                                    .fill(Color("BrighterMainColor"))
                                .fill(getColor(for: item))
                            
                                .frame(width: 343, height: 100)
                            
                            HStack(spacing: 10){
                                Image((item.schedule_activity?.name)!)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                Spacer()
                                VStack{
                                    Text(formatTime(item.start!))
                                        .foregroundColor(item.start! < Date.now ? Color.white : Color.black)
                                        .font(.system(size: 11).monospaced())
                                    Rectangle()
                                        .fill(item.start! < Date.now ? Color.white : Color.black)
                                        .frame(width: 1, height: 25)
                                    Text(formatTime(item.end!))
                                        .foregroundColor(item.start! < Date.now ? Color.white : Color.black)
                                        .font(.system(size: 11).monospaced())
                                    
                                }
                                
                                Spacer()
                                Text((item.schedule_activity?.name) ?? "")
                                    .font(.system(size: 15).bold())
                                    .foregroundColor(item.start! < Date.now ? Color.white : Color.black)
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
                                self.selectedDate = item.date ?? Date()
                                //                            self.isShowEdit = true
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
                        .sheet(item: $selectedSchedule) {
                            vm.getSchedule(forDate: selectedDate)
                        } content: { item in
                            ScheduleEditView(schedule: item)
                        }
                        
                        let category = item.schedule_activity?.category_activity as? Set<Category> ?? []
                        NavigationLink(destination: ActivityDetail(activity: item.schedule_activity!, category: category.first!)) {
                            EmptyView()
                        }
                        .opacity(0)
                    }
                    
                }
                //            .onDelete(perform: deleteSpare)
                .listRowBackground(Color.clear)
                
            }
            .background(.white)
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            //            .sheet(item: $selectedSchedule, onDismiss: {
            //                print("schedule:\(selectedSchedule)")
            //                print("dismiss:\(selectedSchedule?.date)")
            //                vm.getSchedule(forDate: (selectedSchedule?.date) ?? Date.now)
            //            }) { item in
            //                let a = print("show:\(item.date)")
            //                ScheduleEditView(schedule: $selectedSchedule)
            //            }
            
            
            
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
    
    func getColor(for time: Schedule) -> Color {
        
        print(time)
        
        print("TIME END: \(time.end)")
        print("Date Now: \(Date.now)")
        print("TIME DATE: \(time.date)")
        if time.end! < Date.now && time.date! <= Date.now{
            return Color("GrayColor")
        } else if time.start! > Date.now && time.date! >= Date.now {
            return Color("Gray Bright Color")
        } else {
            return Color("BrighterMainColor")
        }
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
