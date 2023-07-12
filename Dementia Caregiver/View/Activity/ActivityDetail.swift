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
    var category:Category
    
    var body: some View {
        ScrollView{
            VStack{
                Image(activity.name!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text(activity.name!)
                        .font(.system(size: 25, weight: .bold))
                    Text(category.name!)
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
                .padding(.horizontal, 25)
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
