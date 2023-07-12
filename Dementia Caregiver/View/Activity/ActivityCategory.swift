//
//  ActivityCategory.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 23/06/23.
//

import SwiftUI

struct ActivityCategory: View {
    private var categoryImage = ["CKAT01", "CKAT02", "CKAT03", "CKAT04", "CKAT05", "CKAT06", "CKAT07", "CKAT08"]
    let categories = CategoryController().getAllCategory()
    
        private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(categories, id: \.self) { category in
                                NavigationLink(destination: ActivityList(category:category)) {
                                Image("C" + category.idCategory!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .background(Color.black
                                        .opacity(0.1)
                                        .shadow(color: .black, radius: 4, x:0, y:1)
                                        .blur(radius: 4, opaque: false))
                                    .padding(5)
                            }
                        }
                    }
                        .padding(10)
            
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
                    .accentColor(Color("ButtonColor"))
    }
}

struct ActivityCategory_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCategory()
    }
}
