//
//  SplashScreenView.swift
//  Dementia Caregiver
//
//  Created by Averill Saladin Atma Setiawan on 12/07/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @AppStorage("userFlag") var isNewDownloaded = true
    
    var body: some View {
        if(isActive == true){
            if isNewDownloaded == true {
                OnBoardingView()
            }else{
                HomeView()
            }
        }else {
            ZStack {
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fill)

                VStack {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.8)
                }
            }
            .background(Color("OnBoardingColor"))
            .onAppear() {
                withAnimation{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
