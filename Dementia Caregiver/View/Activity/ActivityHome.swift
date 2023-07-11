//
//  ActivityHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

extension Category{
    public var activitysArray:[Activity]{
        let set = category_activity as? Set<Activity> ?? []
        return set.sorted{
            $0.name! < $1.name!
        }
    }
}

struct ActivityHome: View {
    //    @FetchRequest(sortDescriptors: []) var activity: FetchedResults<Activity>
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Category.name, ascending: true)], animation: .default) private var cats: FetchedResults<Category>
    
    //    let activityName = ["Menyiram", "Senam", "Berlari"]
    
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    
    //    func filter (nama: String) -> [Activity]{
    //        return activities.filter {
    //            $0.category_activity.
    //        }
    //    }
    
    private var categoryImage = ["HKAT01", "HKAT02", "HKAT03", "HKAT04", "HKAT05", "HKAT06", "HKAT07", "HKAT08"]
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView (.vertical, showsIndicators: false){
                    VStack (alignment: .leading){
                        Text("Aktivitas Terbaru")
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0 ..< 3) {item in
                                    AktivitasTerbaruCardView(image: Image("contoh"))
                                }
                            }
                            .padding(.leading, 15)
                        }
                        HStack{
                            Text("Kategori")
                                .font(.system(size: 17, weight: .semibold))
                                .padding()
                            Spacer()
                            NavigationLink(destination: ActivityCategory(), label: {
                                Text("Lihat semua kategori")
                                    .font(.system(size: 15))
                                    .padding()
                            })
                        }
                        .padding(.top, 10)
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            //                            HStack{
                            //                                ForEach(categoryImage, id: \.self) {imageName in
                            //                                    KategoriCardView(image: Image(imageName))
                            //                                }
                            
                            HStack{
                                ForEach(categories, id: \.self) {element in
                                    VStack{
                                        NavigationLink(destination: ActivityCategory(), label: {
                                            KategoriCardView(image: Image(element.idCategory ?? "Not Found"))
                                            //                                        Text(element.name ?? "Not Found")
                                            //                                            .font(.system(size: 10))
                                            //                                            .foregroundColor(.black)
                                            
                                        })
                                    }
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        
                        VStack(alignment: .leading){
                            ForEach(categories, id: \.self) {element in
                                Text(element.name ?? "Not Found")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                
                                ScrollView (.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(activities, id:\.self) {element in
                                            //                                        ForEach(category.categories_activity?.array as? [Activity] ?? [], id:\.self) {element in
                                            NavigationLink(destination: ActivityDetail()) {
                                                VStack(alignment: .leading){
                                                    List1CardView(image: Image(element.name ?? "contoh"))
                                                    Text(element.name ?? "Not Found")
                                                        .font(.system(size: 13))
                                                        .foregroundColor(.black)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .padding(.top, -5)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        
                        //                            List {
                        //                                Section("Category"){
                        //                                    ForEach(cats, id: \.self) {cat in
                        //                                        NavigationLink(destination: {
                        //                                            List(cat.activityArray){actInCat in
                        //                                                Text(actInCat.name ?? "")
                        //                                            }
                        //                                        }, label: {
                        //                                            HStack{
                        //                                                Text(cat.name ?? "")
                        //                                                //                                            Spacer()
                        //                                                //                                            Text("\(cat.category_activity?.count ?? 0)")
                        //                                            }
                        //                                        })
                        //                                    }
                        //                                }
                        //                            }
                        
                        
                        //                        ScrollView(.horizontal, showsIndicators: false){
                        //                            VStack(alignment: .leading, spacing: 15) {
                        //                                ForEach(1...8, id: \.self) { categories in
                        //                                    Text("Category")
                        //                                        .font(.system(size: 18, weight: .semibold))
                        //
                        //                                    Text("Aktivitas di Luar Ruangan")
                        //                                        .font(.system(size: 18, weight: .semibold))
                        //                                        .padding()
                        //
                        //                                    ScrollView (.horizontal, showsIndicators: false){
                        //                                        HStack{
                        //                                            ForEach(activities, id:\.self) {element in
                        //                                                NavigationLink(destination: ActivityDetail(category: categories)) {
                        //                                                    VStack{
                        //                                                        List1CardView(image: Image(element.name ?? "contoh"))
                        //                                                        Text(element.name ?? "Not Found")
                        //                                                            .font(.system(size: 13))
                        //                                                            .foregroundColor(.black)
                        //                                                            .frame(maxWidth: .infinity, alignment: .leading)
                        //                                                            .padding(.top, -5)
                        //                                                    }
                        //                                                }
                        //                                            }
                        //                                        }
                        //                                        .padding(.leading, 15)
                        //                                    }
                        //                                    .padding(.top, -10)
                        //                                    .padding(.bottom, 5)
                        //                                }
                        //                            }
                        //                        }
                        
                        
                        //                        Text("Aktivitas di Luar Ruangan")
                        //                            .font(.system(size: 18, weight: .semibold))
                        //                            .padding()
                        //
                        //                        ScrollView (.horizontal, showsIndicators: false){
                        //                            HStack{
                        //                                ForEach(activities, id:\.self) {element in
                        //                                    NavigationLink(destination: ActivityDetail()) {
                        //                                        VStack{
                        //                                            List1CardView(image: Image(element.name ?? "contoh"))
                        //                                            Text(element.name ?? "Not Found")
                        //                                                .font(.system(size: 13))
                        //                                                .foregroundColor(.black)
                        //                                                .frame(maxWidth: .infinity, alignment: .leading)
                        //                                                .padding(.top, -5)
                        //                                        }
                        //                                    }
                        //                                }
                        //                            }
                        //                            .padding(.leading, 15)
                        //                        }
                        //                        .padding(.top, -10)
                        //                        .padding(.bottom, 5)
                        
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
            //            .overlay(
            //                RoundedRectangle(cornerRadius: 10)
            //                    .stroke(.black, lineWidth: 1)
            //            )
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
            //            .overlay(
            //                RoundedRectangle(cornerRadius: 10)
            //                    .stroke(.black, lineWidth: 1)
            //            )
                .padding(2)
        }
    }
    
    struct ActivityHome_Previews: PreviewProvider {
        static var previews: some View {
            ActivityHome()
        }
    }
}
