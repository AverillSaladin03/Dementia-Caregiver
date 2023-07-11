//
//  ActivityList.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 26/06/23.
//

import SwiftUI

struct ActivityList: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let imageList = ["contoh3", "contoh3", "contoh3", "contoh3", "contoh3"]
    let activityName = ["Menyiram Tanaman", "Menyiram Tanaman", "Menyiram Tanaman", "Menyiram Tanaman", "Menyiram Tanaman"]
    let activityDesc = ["Asik!", "Asik!", "Asik!", "Asik!", "Asik!"]
    let activityDuration = ["30 menit", "15 menit", "30 menit", "30 menit", "15 menit"]
    
    let activities = ActivityController2().getActivity()
    let categories = CategoryController().getAllCategory()
    
    var body: some View {
        List {
            ForEach(0..<imageList.count, id: \.self) { index in
                NavigationLink(destination: ActivityDetail()) {
                    HStack {
                        Image(imageList[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Adjust the size as needed
                            .cornerRadius(15)
                        
                        VStack(alignment: .leading){
                            Text(activityName[index])
                                .font(.system(size: 17, weight: .bold))
                            
                            Text(activityDesc[index])
                                .font(.system(size: 15, weight: .regular))
                            
                            HStack{
                                Image(systemName: "clock")
                                Text(activityDuration[index])
                            }
                            .font(.system(size: 13, weight: .thin))
                        }
                        .padding(.leading, 10)
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Aktivitas di Luar Ruangan", displayMode: .inline)
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
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
