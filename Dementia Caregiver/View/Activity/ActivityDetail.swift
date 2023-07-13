//
//  ActivityDetail.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 26/06/23.
//

import SwiftUI

struct ActivityDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    
    var activity:Activity
    var category:Category?
    
    @State private var showSheet = false
    
    var body: some View {
        ScrollView{
            VStack{
                Image(activity.name!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 220, alignment: .center)
                    .cornerRadius(0)
                    .padding()
                VStack(alignment: .leading){
                    Text(activity.name!)
                        .font(.system(size: 25, weight: .bold))
                    Text(category!.name!)
                    HStack{
                        Image(systemName: "clock")
                        Text("\(String(activity.duration)) menit")
                    }
                    .font(.system(size: 15, weight: .thin))
                    Divider()
                    Text(activity.descriptionActivity!)
                    HStack{
                        Image(systemName: "lightbulb")
                        Text("Tips")
                    }
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top)
                    Text(activity.tips!)
                }
                .padding(.horizontal, 40)
                
                Button {
                    showSheet.toggle()
                } label: {
                    HStack (alignment: .center){
                        Spacer()
                        
                        Text("Tambah Aktivitas")
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .frame(width: 300, height: 41)
                    .background(Color("ButtonColor"))
                    .foregroundColor(.white)
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
                    
                }
                .padding(.vertical, 20)
                .sheet(isPresented: $showSheet) {
                    ScheduleAddView(selectedActivity: activity)
                        .preferredColorScheme(.light)
                }
                
            }
        }
        .accentColor(Color("ButtonColor"))
        .navigationBarTitle("Detail Aktivitas", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
        }
        )
    }
    
}

struct ActivityDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        ActivityDetail(activity: ActivityController2().getActivity()[0], category: CategoryController().getAllCategory()[0])
    }
}
