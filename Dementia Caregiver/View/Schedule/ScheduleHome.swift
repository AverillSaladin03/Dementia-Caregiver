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
    @State private var showSheet = false
    @Binding var listSpareTimes: [SpareTime]

    var body: some View {
        ScrollView(.vertical)
        {
            LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]){
                Section{
                    ScrollView(.horizontal){
                        HStack(spacing: 7){
                            ForEach(taskModel.currentWeek, id: \.self) { day in
                                VStack(spacing: 10){
                                    let dateString = taskModel.extractDate(date: day, format: "EEE")
                                    let firstCharacter = String(dateString.prefix(1))
                                    Text(firstCharacter)
                                    
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                }
                                .font(.system(size: 17).bold())
                                .foregroundStyle(taskModel.isToday(date: day) ? .primary : .secondary)
                                .foregroundColor(taskModel.isToday(date: day) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                        if taskModel.isToday(date: day){
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color("ButtonColor"))
                                                .matchedGeometryEffect(id: "", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation {
                                        taskModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    VStack(spacing: 16){
                        ScheduleList(listSpareTimes: $listSpareTimes)
                    }
                } header: {
                    HeaderView()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
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
                showSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(Color("ButtonColor"))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .sheet(isPresented: $showSheet) {
                ScheduleNew()
            }
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(Color.white)
    }
    
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
    
}

struct ScheduleHome_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleHome(listSpareTimes: .constant(listSpareTime))
    }
}
