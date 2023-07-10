//
//  ActivityCategory.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 23/06/23.
//

import SwiftUI

struct ActivityCategory: View {
    private var categoryImage = ["CKAT01", "CKAT02", "CKAT03", "CKAT04", "CKAT05", "CKAT06", "CKAT07", "CKAT08"]
//    private var imageTitle = ["Aktivitas di Luar Ruangan", "Aktivitas di Dalam Ruangan", "Aktivitas di Malam Hari", "Aktivitas Bersama", "Aktivitas 15 Menit", "Aktivitas Fisik", "Aktivitas Mengasah Otak", "Aktivitas Kreatif"]
    //    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        //        ScrollView {
        //            LazyVGrid(columns: gridItemLayout, spacing: 10) {
        //                ForEach(categoryImage, id: \.self) { categoryImage in
        //                    Image(categoryImage)
        //                        .resizable()
        //                        .aspectRatio(contentMode: .fill)
        //                        .frame(width: 160, height: 160) // Adjust the height as needed
        //                        .cornerRadius(10)
        //                }
        //            }
        //            .padding()
        //        }
        
        ScrollView{
            VStack {
                ForEach(0..<categoryImage.count / 1, id: \.self) { rowIndex in
                    HStack {
                        Spacer()
                        Spacer()
                        ForEach(0..<2, id: \.self) { columnIndex in
                            let index = rowIndex * 2 + columnIndex
                            NavigationLink(destination: ActivityList()) {
                                if index < categoryImage.count {
                                    VStack(alignment: .leading){
                                        Image(categoryImage[index])
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: 160, height: 160)
                                            .cornerRadius(10)
//                                            .border(.black)
                                        
//                                        Text(imageTitle[index])
//                                            .font(.system(size: 12, weight: .semibold))
//                                            .foregroundColor(.gray)
                                    }
                                } else {
                                    Spacer()
                                }
                            }
                            .padding(3)
                        }
                        Spacer()
                        Spacer()
                    }
                }
            }
            
            .navigationBarTitle("Kategori Aktivitas", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                Text("Aktivitas")
            }
            )
        }
    }
}

struct ActivityCategory_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCategory()
    }
}
