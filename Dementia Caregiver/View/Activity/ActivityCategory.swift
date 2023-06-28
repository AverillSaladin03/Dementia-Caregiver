//
//  ActivityCategory.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 23/06/23.
//

import SwiftUI

struct ActivityCategory: View {
    private var categoryImage = ["contoh3", "contoh", "contoh2", "contoh2", "contoh3", "contoh3", "contoh3", "contoh"]
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
                ForEach(0..<categoryImage.count / 2, id: \.self) { rowIndex in
                    HStack {
                        ForEach(0..<2, id: \.self) { columnIndex in
                            let index = rowIndex * 2 + columnIndex
                            NavigationLink(destination: ActivityList()) {
                                if index < categoryImage.count {
                                    Image(categoryImage[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 160, height: 160)
                                        .cornerRadius(10)
                                } else {
                                    Spacer()
                                }
                            }
                            .padding(8)
                        }
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
