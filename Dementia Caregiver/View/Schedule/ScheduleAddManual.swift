//
//  ScheduleAddManual.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 22/06/23.
//

import SwiftUI

struct ScheduleAddManual: View {
    
    @Environment(\.dismiss) var dismiss
    @FocusState var isInputActive: Bool
    @State var activityName: String = ""
    @State var firstInput: Int = 0
    
    @State var selectedTime = "menit"
    let time = ["jam", "menit"]
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Button("Kembali") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Jadwal")
                        .font(.system(size: 17).bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                    Button("Tambah") {
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom, 45)
                
                VStack(spacing: 20){
                    HStack{
                        Text("Nama: ")
                        TextField("aktivitas", text: $activityName)
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.gray), lineWidth: 1))
                    
                    HStack{
                        Text("Durasi: ")
                        TextField("", value: $firstInput, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                        
                        Picker("", selection: $selectedTime) {
                            ForEach(time, id: \.self) {
                                Text($0)
                            }
                        }
                        .accentColor(.gray)

                    }
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.gray), lineWidth: 1))
                    
                }
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                
                
                Spacer()
            }
            .padding()
        }
        
        
    }
}

struct ScheduleAddManual_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleAddManual()
    }
}
