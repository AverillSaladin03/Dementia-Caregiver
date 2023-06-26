//
//  ActivityDetail.swift
//  Dementia Caregiver
//
//  Created by Zefanya Oktaviana Indrasanti on 26/06/23.
//

import SwiftUI

struct ActivityDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            Text("hai")
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
