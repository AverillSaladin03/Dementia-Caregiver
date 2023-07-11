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
    
    var body: some View {
        ScrollView{
            VStack{
                Image("contoh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text("Menyiram Tanaman")
                        .font(.system(size: 25, weight: .bold))
                    Text("Aktivitas luar ruangan")
                    HStack{
                        Image(systemName: "clock")
                        Text("50 Menit")
                    }
                    .font(.system(size: 15, weight: .thin))
                    Divider()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut ullamcorper libero. Sed quis laoreet erat. Sed facilisis porta placerat. In a dui dolor. Mauris pulvinar dolor enim, sit amet mattis velit hendrerit eu.")
                    HStack{
                        Image(systemName: "lightbulb")
                        Text("Tips")
                    }
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.top)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ut ullamcorper libero. Sed quis laoreet erat. Sed facilisis porta placerat. In a dui dolor.")
                }
                .padding(.leading, 25)
            }
        }
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
        ActivityDetail()
    }
}
