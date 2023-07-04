//
//  ActivityHome.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ActivityHome: View {
    
    @FetchRequest(sortDescriptors: []) var activity: FetchedResults<Activity>
    
    let activityName = ["Menyiram", "Senam", "Berlari", "Asik!", "Asik!"]
    
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
                            HStack{
                                ForEach(0 ..< 7) {item in
                                    KategoriCardView(image: Image("contoh2"))
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        
                        Text("Aktivitas di Luar Ruangan")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(activity, id:\.self) {element in
                                    NavigationLink(destination: ActivityDetail()) {
                                        VStack{
                                            List1CardView(image: Image("contoh2"))
                                            Text(element.nama!)
                                                .font(.system(size: 13))
                                                .foregroundColor(.black)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.top, -5)
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        Text("Aktivitas 15 Menit")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0 ..< 5) {item in
                                    NavigationLink(destination: ActivityDetail()) {
                                        VStack{
                                            List1CardView(image: Image("contoh2"))
                                            Text(activityName[item])
                                                .font(.system(size: 13))
                                                .foregroundColor(.black)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.top, -5)
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        Text("Aktivitas Malam Hari")
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                        
                        ScrollView (.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0 ..< 5) {item in
                                    NavigationLink(destination: ActivityDetail()) {
                                        VStack{
                                            List1CardView(image: Image("contoh2"))
                                            Text(activityName[item])
                                                .font(.system(size: 13))
                                                .foregroundColor(.black)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.top, -5)
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 15)
                        }
                        .padding(.top, -10)
                        .padding(.bottom, 5)
                        
                        .navigationTitle("Aktivitas")
                    }
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
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(2)
    }
}

struct List1CardView: View{
    let image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(2)
    }
}

struct List2CardView: View{
    let image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(2)
    }
}

struct List3CardView: View{
    let image: Image
    var body: some View {
        image
            .resizable()
            .frame(width: 100, height: 100, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(2)
    }
}

struct ActivityHome_Previews: PreviewProvider {
    static var previews: some View {
        ActivityHome()
    }
}
