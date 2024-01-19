//
//  ModelData.swift
//  SwiftUITest
//
//  Created by Edwin Yovany on 9/12/23.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No se pudo encontrar \(filename) en el bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("No se pudo cargar \(filename) desde el bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("No se pudo decodificar \(filename) como \(T.self):\n\(error)")
    }
}
