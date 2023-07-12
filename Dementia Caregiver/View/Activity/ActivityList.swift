//
//  ActivityList.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 26/06/23.
//

import SwiftUI

struct ActivityList: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    var category:Category
    
    var body: some View {
        let act = category.category_activity?.allObjects as? [Activity]
        VStack{
            ScrollView {
                ForEach(act!, id: \.self) { activity in
                    NavigationLink(destination: ActivityDetail(activity: activity, category: category)) {
                        HStack {
                            Image(activity.name!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100) // Adjust the size as needed
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading){
                                Text(activity.name!)
                                    .font(.system(size: 17, weight: .bold))
                                    .multilineTextAlignment(.leading)
//                                Spacer()
                                Text(activity.descriptionActivity!)
                                    .font(.system(size: 15, weight: .regular))
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
//                                Spacer()
                                HStack{
                                    Image(systemName: "clock")
                                    Text("\(String(activity.duration)) menit")
                                }
                                .font(.system(size: 13, weight: .thin))
                                .padding(.top,-8)
                            }
                            .padding(.leading, 10)
                            Spacer()
                        }
                        .foregroundColor(.black)
                        
                    }
                    Divider()
                }
                .navigationBarTitle(category.name!, displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                )
            }
            .padding()
        }
        .accentColor(Color("ButtonColor"))
    }
}

//struct ActivityList_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityList(category: Category)
//    }
//}
