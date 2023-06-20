//
//  ModelData.swift
//  Dementia Caregiver
//
//  Created by Yusron Alfauzi on 20/06/23.
//

import Foundation

final class ModelData: ObservableObject {
    
    @Published var aktivitas: [Aktivitas] = load("aktivitasData.json")
    
    var categories: [String: [Aktivitas]] {
        Dictionary(
            grouping: aktivitas,
            by: { $0.category.rawValue }
        )
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
