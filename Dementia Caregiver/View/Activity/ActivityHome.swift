//
//  ActivityHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ActivityHome: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default) private var cats: FetchedResults<Category>
    
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    //    var category:Category
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView (.vertical, showsIndicators: false){
                    VStack (alignment: .leading){
                        Text("Rekomendasi Aktivitas")
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                let recommendationActivity = activities
                                ForEach(recommendationActivity.shuffled().prefix(3)) {activity in
                                    var choosenActivityCategory = (activity.category_activity?.allObjects)![0] as! Category
                                    NavigationLink(destination: ActivityDetail(activity: activity, category: choosenActivityCategory, fromSchedule: false), label: {
                                        RecommendationActivityCardView(image: Image(activity.name ?? "contoh"), activity: activity)
                                    }
                                    )}
                            }
                            .padding(.horizontal, 15)
                        }
                        
                        // CATEGORY LIST
                        HStack{
                            Text("Kategori")
                                .font(.system(size: 18, weight: .semibold))
                                .padding()
                            Spacer()
                            NavigationLink(destination: ActivityCategory(), label: {
                                Text("Lihat semua kategori")
                                    .font(.system(size: 15))
                                    .padding()
                                    .foregroundColor(Color("ButtonColor"))
                                
                            })
                        }
                        .padding(.top, 10)
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(categories, id: \.self) {category in
                                    VStack{
                                        NavigationLink(destination: ActivityList(category: category), label: {
                                            VStack(alignment: .leading){
                                                KategoriCardView(image: Image(category.idCategory ?? "Not Found"))
                                                Text(category.name ?? "Not Found")
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: 80, alignment: .leading)
                                                    .font(.system(size: 13))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            .frame(width: 84)
                                        })
                                    }
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        // ACTIVITY LIST
                        VStack(alignment: .leading){
                            ForEach(categories, id: \.self) {category in
                                Text(category.name ?? "Not Found")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.leading, 15)
                                ScrollView (.horizontal, showsIndicators: false){
                                    HStack{
                                        let newActivities = category.category_activity?.allObjects as? [Activity]
                                        ForEach(newActivities!, id:\.self) {activity in
                                            NavigationLink(destination: ActivityDetail(activity: activity, category:category, fromSchedule: false)) {
                                                VStack(alignment: .leading){
                                                    List1CardView(image: Image(activity.name ?? "contoh"))
                                                    Text(activity.name ?? "Not Found")
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(2)
                                                        .font(.system(size: 13))
                                                        .foregroundColor(.black)
                                                        .padding(.top, -5)
                                                        .padding(.bottom, 10)
                                                    
                                                    Spacer()
                                                }
                                                .frame(width: 104)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 15)
                                }
                            }
                        }
                        //                        .padding()
                        .navigationTitle("Aktivitas")
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct RecommendationActivityCardView: View{
        let image: Image
        let activity:Activity
        var body: some View {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 210, alignment: .center)
                .cornerRadius(10)
                .overlay(ImageOverlay(activity: activity), alignment: .bottomLeading)
        }
    }
    
    struct KategoriCardView: View{
        let image: Image
        var body: some View {
            image
                .resizable()
                .frame(width: 80, height: 80, alignment: .leading)
                .cornerRadius(10)
                .padding(2)
        }
    }
    
    struct List1CardView: View{
        let image: Image
        var body: some View {
            image
                .resizable()
                .frame(width: 100, height: 100, alignment: .leading)
                .cornerRadius(10)
                .fixedSize()
                .padding(2)
        }
    }
    
    struct ImageOverlay: View {
        var activity:Activity
        let gradient = Gradient(colors: [.clear, .black])
        var body: some View {
            ZStack{
                LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    Spacer()
                    Text(activity.name!)
                        .font(.system(size:25, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text(activity.descriptionActivity!)
                        .font(.system(size:15, weight: .medium))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .padding(16)
                .cornerRadius(10)
            }
        }
    }
}

//    struct ActivityHome_Previews: PreviewProvider {
//        static var previews: some View {
//            ActivityHome()
//        }
//    }
//}
