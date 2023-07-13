//
//  ActivityHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ActivityHome: View {
    //    @FetchRequest(sortDescriptors: []) var activity: FetchedResults<Activity>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default) private var cats: FetchedResults<Category>
    
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    
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
                                ForEach(activities.prefix(3)) {activity in
                                    NavigationLink(destination: ActivityCategory(), label: {
                                        AktivitasTerbaruCardView(image: Image(activity.name ?? "contoh"))
                                    }
                                    )}
                            }
                            .padding(.leading, 15)
                        }
                        
                        // CATEGORY LIST
                        HStack{
                            Text("Kategori")
                                .font(.system(size: 17, weight: .semibold))
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
                                ForEach(categories, id: \.self) {element in
                                    VStack{
                                        NavigationLink(destination: ActivityCategory(), label: {
                                            VStack(alignment: .leading){
                                                KategoriCardView(image: Image(element.idCategory ?? "Not Found"))
                                                Text(element.name ?? "Not Found")
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: 80, alignment: .leading)
                                                    .font(.system(size: 10))
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            .frame(width: 84)
                                        })
                                    }
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        // ACTIVITY LIST
                        VStack(alignment: .leading){
                            ForEach(categories, id: \.self) {category in
                                Text(category.name ?? "Not Found")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                ScrollView (.horizontal, showsIndicators: false){
                                    HStack{
                                        let newActivities = category.category_activity?.allObjects as? [Activity]
                                        ForEach(newActivities!, id:\.self) {activity in
                                            NavigationLink(destination: ActivityDetail(activity: activity, category:category)) {
                                                VStack(alignment: .leading){
                                                    List1CardView(image: Image(activity.name ?? "contoh"))
                                                    Text(activity.name ?? "Not Found")
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(2)
                                                        .font(.system(size: 11))
                                                        .foregroundColor(.black)
                                                        .padding(.top, -5)
                                                        .padding(.bottom, 10)
                                                        
                                                    Spacer()
                                                }.frame(width: 104)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        .navigationTitle("Aktivitas")
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct AktivitasTerbaruCardView: View{
        let image: Image
        var body: some View {
            image
                .resizable()
                .frame(width: 350, height: 210, alignment: .leading)
                .cornerRadius(10)
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
    
    struct ActivityHome_Previews: PreviewProvider {
        static var previews: some View {
            ActivityHome()
        }
    }
}
