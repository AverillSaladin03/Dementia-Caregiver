//
//  ScheduleHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleHome: View {
    
    @StateObject var taskModel: TaskModel = TaskModel()
    @Namespace var animation
    @State private var isShowAdd = false
//    @Binding var listSpareTimes: [Spares]
    
    @StateObject var vm = ScheduleController.shared

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                ScrollView(.horizontal){
                    HStack(spacing: 7){
                        ForEach(taskModel.currentWeek, id: \.self) { day in
                            VStack(spacing: 10){
                                let dateString = taskModel.extractDate(date: day, format: "EEE")
                                let firstCharacter = String(dateString.prefix(1))
                                Text(firstCharacter)
                                
                                Text(taskModel.extractDate(date: day, format: "dd"))
                                Circle()
                                    .fill(Color("ButtonColor"))
                                    .frame(width: 8, height: 8)
                                    .opacity(taskModel.nowToday(date: day) ? 1 : 0)
                            }
                            .font(.system(size: 17).bold())
                            .foregroundStyle(taskModel.isToday(date: day) ? .primary : .secondary)
                            .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                            .frame(width: 45, height: 85)
                            .background(
                                ZStack{
                                    if taskModel.isToday(date: day){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color("ButtonColor"))
                                            .matchedGeometryEffect(id: "", in: animation)
                                    }
                                    
                                   
                                }
                            )
//                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation {
                                    taskModel.currentDay = day
                                    taskModel.loadData(dateSelect: day)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    withAnimation {
                        taskModel.loadData(dateSelect: taskModel.currentDay)
                    }
                }
                ScheduleList()
            }
        }
       
    }
    
    func HeaderView() -> some View{
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 10){
                Text("Jadwal")
                    .font(.largeTitle.bold())
                
                Text(Date()
                    .formatted(date: .abbreviated, time: .omitted))
                .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                isShowAdd.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("ButtonColor"))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .sheet(isPresented: $isShowAdd, onDismiss: {
                vm.getSchedule(forDate: taskModel.currentDay)
            }) {
                ScheduleAddView()
                    .preferredColorScheme(.light)
            }
        }
        .padding()
        .background(Color.white)
    }
    
}

struct ScheduleHome_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleHome()
    }
}
