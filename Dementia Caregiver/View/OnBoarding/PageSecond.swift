//
//  PageSecond.swift
//  Onboarding
//
//  Created by Yusron Alfauzi on 25/06/23.
//

import SwiftUI

struct PageSecond: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("onboarding2")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                VStack {
                    Section {
                        VStack(alignment: .leading, spacing: 10){
                            Spacer()
                            Text("Sesuaikan Jadwal dengan Kebutuhan")
                                .font(.system(size: 34).bold())
                                .foregroundColor(.white)
                            Text("Buat jadwalmu sendiri untuk mempermudah mengingat aktivitas harian orang demensia")
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                        }
                        .padding()
                        .padding(.trailing, 35)
                        .padding(.bottom)
                    } header: {
                        NavigationLink(destination: FormView().navigationBarBackButtonHidden(), label: {
                            Text("Lewati")
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding()
                        })
                    }
                }
            }
            .background(Color("OnBoardingColor"))
        }
    }
}

struct PageSecond_Previews: PreviewProvider {
    static var previews: some View {
        PageSecond()
    }
}
