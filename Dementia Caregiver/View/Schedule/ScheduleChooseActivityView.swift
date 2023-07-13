//
//  ScheduleAdd.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleChooseActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showSheet = false
    @Binding var selectedActivity : Activity?
    @State private var searchField : String = ""
    @State private var showCancelButton: Bool = false
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    
    var activity: Activity?
    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack{
                    Text("Pilih Aktivitas")
                        .font(.system(size: 17).bold())
                        .frame(alignment: .center)
                    Button("Selesai") {
                        dismiss()
                    }
                    .foregroundColor(Color("ButtonColor"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom, 32)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search",
                              text: $searchField)
                }
                .padding(8)
                .background(Color("GrayColor"))
                .cornerRadius(10)
                .padding(.bottom)
                
                List{
                    ForEach (categories, id: \.self){ category in
                        Section (header: Text(category.name!)){
                            var newActivities = searchField.isEmpty ? category.category_activity?.allObjects as? [Activity] : activities.filter { $0.name!.localizedCaseInsensitiveContains(searchField)
                            }
                            ForEach (searchField.isEmpty ? activities : newActivities!, id: \.self) { activity in
                                HStack {
                                    VStack (alignment: .leading, spacing: 1){
                                        Text(activity.name ?? "Not Found")
                                        Text("\(String(activity.duration)) menit")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.white)
                                    Spacer()
                                    if selectedActivity?.name == activity.name{
                                        Image(systemName: "checkmark")
                                            .foregroundColor(Color("ButtonColor"))
                                    }
                                }
                                .padding(.vertical, 2)
                                .onTapGesture {
                                    selectedActivity = activity
                                }
                            }
                            .listStyle(.plain)

                        }
                    }
                }
                .onAppear {
                    selectedActivity = activities[0]
                }
                .listStyle(.plain)
                
                //                Button {
                //                    showSheet.toggle()
                //                } label: {
                //                    HStack {
                //                        Text("+ Tambah Aktivitas Baru")
                //                    }
                //                    .foregroundColor(Color.white)
                //                    .padding(.horizontal,32)
                //                    .padding(.vertical,12)
                //                    .background(Color("ButtonColor"))
                //                    .cornerRadius(8)
                //                }
                //                .sheet(isPresented: $showSheet) {
                //                    ScheduleAddManual()
                //                }
                
                Spacer()
            }
            .padding()
        }
    }
}

//struct ScheduleAdd_Previews: PreviewProvider {
//    static var previews: some View {
//        let dummyActivity: Activity? = Activity()
//        return ScheduleChooseActivityView(selectedActivity: .constant(dummyActivity), activity: activity)
//    }
//}
