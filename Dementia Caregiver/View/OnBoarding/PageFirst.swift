//
//  PageFirst.swift
//  Onboarding
//
//  Created by Yusron Alfauzi on 25/06/23.
//

import SwiftUI

struct PageFirst: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("onboarding1")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .offset(y: -30)
                
                VStack {
                    Section {
                        VStack(alignment: .leading, spacing: 10){
                            Spacer()
                            Text("Temukan Berbagai Aktivitas Harian Orang Demensia")
                                .font(.system(size: 34).bold())
                                .foregroundColor(.white)
                            Text("Untuk membantu orang demensia tetap aktif dan melatih fungsi otak")
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

struct PageFirst_Previews: PreviewProvider {
    static var previews: some View {
        PageFirst()
    }
}
