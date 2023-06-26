//
//  ScheduleList.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleList: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                            .fill(.blue)
                            .frame(width: 343, height: 100)

            HStack(spacing: 10){
                Image("contoh")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .padding(.leading, 9)
                Spacer()
                VStack{
                    Text("10:30")
                        .font(.system(size: 11))
                    Rectangle()
                        .fill(.white)
                        .frame(width: 1, height: 25)
                    Text("11:30")
                        .font(.system(size: 11))
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Bermain Lego")
                        .font(.system(size: 17).bold())
                        .padding(.trailing)
                    Text("blabla")
                        .font(.system(size: 11))
                }
                Spacer()
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}
