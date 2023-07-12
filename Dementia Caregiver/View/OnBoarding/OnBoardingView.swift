//
//  Onboarding.swift
//  Onboarding
//
//  Created by Yusron Alfauzi on 25/06/23.
//

import SwiftUI

struct OnBoardingView: View {
    
//    @State private var selectedTab = 0
//
//    let pages: [AnyView] = [
//        AnyView(PageFirst()),
//        AnyView(PageSecond()),
//        AnyView(PageThird())
//    ]
    
    var body: some View {
//        NavigationStack {
//            TabView(selection: $selectedTab) {
//                ForEach(pages.indices, id: \.self) { index in
//                    pages[index]
//                }
//            }
//            .background(.black)
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .edgesIgnoringSafeArea(.all)
//            .overlay (
//                HStack(spacing: 15){
//                    ForEach (pages.indices ,id: \.self) {index in
//                        VStack {
//                            Spacer()
//                            Capsule()
//                                .fill(self.selectedTab == index ? Color.blue : Color.white)
//                                .frame(width: 40, height: 8)
//                        }
//                    }
//                }
//            )
//        }
//    }
//}

        NavigationStack {
            VStack {
                TabView{
                    PageFirst().tag(0)
                    PageSecond().tag(1)
                    PageThird().tag(2)
                }
                .background(.black)
                .tabViewStyle(.page(indexDisplayMode: .always))
                .edgesIgnoringSafeArea(.all)
            }
        }
        .environment(\.colorScheme, .light)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
