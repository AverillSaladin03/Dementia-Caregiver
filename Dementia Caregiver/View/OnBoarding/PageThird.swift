//
//  PageThrid.swift
//  Onboarding
//
//  Created by Yusron Alfauzi on 25/06/23.
//

import SwiftUI

struct PageThird: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("onboarding3")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .offset(y: -30)

                VStack(alignment: .leading, spacing: 10){
                    Spacer()
                    Group {
                        Text("Rekomendasi Aktivitas Harian")
                            .font(.system(size: 34).bold())
                        .foregroundColor(.white)
                        Text("Temukan  berbagai rekomendasi aktivitas harian sesuai kebiasaan, hobi, dan kondisi ODD")
                                           .font(.system(size: 17))
                                           .foregroundColor(.white)
                                           .padding(.bottom, 30)
                    }
                    .padding(.trailing, 35)
    
                    NavigationLink(destination: FormView().navigationBarBackButtonHidden(), label: {
                        Text("Yuk, Mulai!")
                            .font(.system(size: 17))
                            .bold()
                            .foregroundColor(Color("OnBoardingColor"))
                            .frame(width: 349, height: 41, alignment: .center)
                            .background(.white)
                            .cornerRadius(10)
                    })
                }
                .padding()
                .padding(.bottom)
            }
            .background(Color("OnBoardingColor"))
        }
    }
}

struct PageThrid_Previews: PreviewProvider {
    static var previews: some View {
        PageThird()
    }
}
