//
//  FormView.swift
//  Dementia Caregiver
//
//  Created by Reyner Fernaldi on 22/06/23.
//
import CoreData
import SwiftUI

enum Items: String, CaseIterable, Equatable {
    case Olahraga
    case Berkebun
    case Seni
    case Memasak
    case Musik
    case Bepergian
    case Game
    case Film
    case Memancing
    case Membaca
    case Fotografi
    case Menggambar
    case Teknologi
    case Otomotif
}


extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            self.init(white: 1.0, alpha: 1.0)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


struct CustomButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(10)
            .background(color)
            .cornerRadius(10)
    }
}

struct GridColumn:View {
    let item: Items
    
    @Binding var items: [Items]
    
    var body: some View {
        Button(action: {
            if items.contains(item) {
                items.removeAll { $0 == item}
            } else {
                items.append(item)
            }
        }, label: {
            Text(item.rawValue)
                .tag(item)
                .foregroundColor(items.contains(item) ? .white : .black)
                .font(.caption)
        })
        
        .frame(width: 80, height: 40)
        .background(items.contains(item) ? Color(UIColor(hex: "#4FACC9")) : Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 0.1)
        )
        .shadow(color: .gray.opacity(0.3), radius: 1, x: 1, y: 2)
    }
}


struct FormView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let newODDController = ODDController()
    
    let newActivityController = ActivityController2()
    
    let newCategoryController = CategoryController()

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ODD.birth_date, ascending: true)],
        animation: .default)
    private var ODDs: FetchedResults<ODD>
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hex: "#4FACC9")
    }
    
    let layout = Array(repeating: GridItem(.adaptive(minimum:50)), count: 4)
    @State var selections: [String] = []
    
    @State var birthDate = Date.now
    @State var selectedDisability: Int = 0
    let disabilities = ["Sehat", "Sebagian", "Lumpuh"]
    
    @State var selectedLevel: Int = 0
    let levels = ["Ringan", "Sedang", "Berat"]
    
    var rows: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    @State  var selectedItems: [Items] = []
    
    @State private var isActive = false
    
    
    
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                ScrollView{
                    VStack(alignment: .leading){
                        Group{
                            Text("Kelumpuhan")
                                .padding(.bottom, 5)
                                .fontWeight(.semibold)
                            Text("**Sehat**: Masih dapat berjalan dan beraktivitas normal").font(.caption).foregroundColor(.secondary)
                            Text("**Sebagian**: Masih dapat bergerak, tetapi membutuhkan bantuan orang lain").font(.caption).foregroundColor(.secondary)
                            Text("**Lumpuh**: Tidak dapat bergerak dan membutuhkan bantuan orang lain").font(.caption).foregroundColor(.secondary)
                            
                            HStack{
                                
                                ForEach(0..<disabilities.count, id: \.self) { button in
                                    Button(action: {
                                        self.selectedDisability = button
                                    }) {
                                        Text("\(self.disabilities[button])")
                                            .font(.caption)
                                            .fontWeight(self.selectedDisability == button ? .bold : .none)
                                            .frame(width: 100, height: 35)
                                            .foregroundColor( self.selectedDisability == button ? Color.white : Color.black)
                                            .background(self.selectedDisability == button ? Color(UIColor(hex: "#4FACC9")) : Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 0.1)
                                            )
                                            .cornerRadius(20)
                                            .shadow(color: .gray.opacity(0.3), radius: 1, x: 1, y: 2)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.top, 5)
                            .padding(.bottom)
                        
                            
                        }
                        
                        
                        Group{
                            Text("Level Demensia")
                                .font(.body)
                                .padding(.bottom, 5)
                                .fontWeight(.semibold)
                            Text("**Ringan**: Lupa kata-kata tertentu atau lokasi meletakkan barang").font(.caption).foregroundColor(.secondary)
                            Text("**Sedang**: Perubahan perilaku yang signifikan atau perubahan pola tidur").font(.caption).foregroundColor(.secondary)
                            Text("**Berat**: Hilangnya kemampuan berkomunikasi atau hilangnya kemampuan fisik ").font(.caption).foregroundColor(.secondary)
                            
                            HStack{
                                ForEach(0..<levels.count, id: \.self) { button in
                                    Button(action: {
                                        self.selectedLevel = button
                                    }) {
                                        Text("\(self.levels[button])")
                                            .font(.caption)
                                            .fontWeight(self.selectedLevel == button ? .bold : .none)
                                            .frame(width: 110, height: 35)
                                            .foregroundColor( self.selectedLevel == button ? Color.white : Color.black)
                                            .background(self.selectedLevel == button ? Color(UIColor(hex: "#4FACC9")) : Color.white)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.black, lineWidth: 0.1)
                                            )
                                            .cornerRadius(20)
                                            .shadow(color: .gray.opacity(0.3), radius: 1, x: 1, y: 2)
                                        Spacer()
                                    }
                                }
                            }
                            .padding(.top, 5)
                            .padding(.bottom)
                            

                        }
                        
                        Group{
                            Text("Hobi")
                                .padding(.bottom, 5)
                                .fontWeight(.semibold)
                            Text("Silahkan Pilih Minimal **3**").font(.caption).foregroundColor(.secondary)
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: rows) {
                                    ForEach(Items.allCases, id: \.self) { item in
                                        GridColumn(item: item, items: $selectedItems)
                                    }
                                }
                            }
                            .frame(height: 200)
                        }
                        
                        Spacer()
                    }
                    

                    
                    Button(action: {
                        isActive = true
                        newODDController.addODD(demLevel: selectedLevel, disLevel: selectedDisability, hobbies: selectedItems)
                        ActivityController2().addActivity(demLevel: selectedLevel, disLevel: selectedDisability, hobbies: selectedItems)
                        CategoryController().addCategory()
                        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
                    }) {
                        HStack (alignment: .center){
                            Spacer()

                            Text("Selesai")
                                .fontWeight(.bold)

                            Spacer()
                        }
                        .frame(height: 41)
                        .background(Color("ButtonColor"))
                        .foregroundColor(.white)
                        .mask {
                            RoundedRectangle(cornerRadius: 8)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    NavigationLink(destination: SpareTimeView().navigationBarBackButtonHidden(), isActive: $isActive) {
                        EmptyView()
                    }
                    
                    
                    Text(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
                    
                        ForEach(ODDs, id: \.self) { item in
                            Text("Item at \(item.hobbies!)")
                        }
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
            }
            .navigationTitle("Data Orang dengan Demensia")
            .navigationBarTitleDisplayMode(.inline)
            
        }

    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
