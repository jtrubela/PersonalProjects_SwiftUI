//
//  BundleDecoder.swift
//  Stash House
//
//  Created by Justin Trubela on 7/14/23.
//

import Foundation

struct JSONBundleDecoder<T: Hashable & Codable> {
    let fileName: String
    let fileExtension: String = "json"
    
    func decodeJSON() -> [T] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("not found")
            fatalError("Unable to find JSON file")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            let items = try decoder.decode([T].self, from: data)
            print(items.count)
            return items
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
}
//
//
//struct BundleDecoder {
//
//    func decodeJSON()  -> [Topps88CGCard]  {
//
//        guard let url = Bundle.main.url(forResource: "Topps88CG", withExtension: "json") else {
//            fatalError("Unable to find JSON file")
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let cards = try decoder.decode([Topps88CGCard].self, from: data)
//
//            return cards
//        } catch {
//            fatalError("Failed to decode JSON: \(error)")
//        }
//    }
//}
//
//struct SysDecoder {
//
//    func decodeJSON()  -> [Console]  {
//
//        guard let url = Bundle.main.url(forResource: "VideoGame", withExtension: "json") else {
//            print("JSON File unfound")
//            fatalError("Unable to find JSON file")
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let consoles = try decoder.decode([Console].self, from: data)
//
//            print("\(consoles.count)")
//            return consoles
//        } catch {
//            fatalError("Failed to decode JSON: \(error)")
//        }
//    }
//}
