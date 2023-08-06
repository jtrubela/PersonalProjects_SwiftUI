//
//  Media.swift
//  Stash House
//
//  Created by Justin Trubela on 7/18/23.
//

import Foundation
import SwiftUI



import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let mediaTypes: [MediaType]
}

// MARK: - MediaType
struct MediaType: Codable, Hashable {
    let name: Name
    let collection: [myCollection]
}

// MARK: - Collection
struct myCollection: Codable, Hashable {
    let name: String
    let mediaType: Name
    let producedBy, genre, releaseDate: String
}

enum Name: String, Codable {
    case dvd = "DVD"
    case vhs = "VHS"
}
//struct MediaType: Codable, Hashable {
//    var name: String
//    var collection: String
//}

struct Movie: Codable, Hashable {
    var name: String
    var mediaType: String
    var producedBy: String
    var genre: String
    var releaseDate: Date
}

struct MediaList: View {
    @State var mediaTypes : [MediaType] = []
    var decoder = JSONBundleDecoder<MediaType>(fileName: "Media")

    var body: some View {
        NavigationStack{
            VStack{
                //List the items
                
                List(mediaTypes, id: \.name){ media in
                    NavigationLink{
                        VStack{
//                            Text(media.name)


                            Spacer()
                            NavigationLink{

                            } label: {

                                Text("My Movies")
                            }
                            Spacer()
                        }
                    } label: {
//                        Text(type.name)
                    }
                }
                
            }
            .navigationTitle("Movie Stash")
//TODO: Check against new test data
            .onAppear {
                mediaTypes = decoder.decodeJSON()
//                print(mediaTypes.count)
            }
        }
    }
    
    
    
}

struct MediaList_Previews: PreviewProvider {
    static var previews: some View {
        MediaList()
    }
}

//struct JSONBundleDecoder<T: Hashable & Codable> {
//    let fileName: String
//    let fileExtension: String = "json"
//    
//    func decodeJSON() -> [T] {
//        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
//            print("not found")
//            fatalError("Unable to find JSON file")
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let items = try decoder.decode([T].self, from: data)
//            print(items.count)
//            return items
//        } catch {
//            fatalError("Failed to decode JSON: \(error)")
//        }
//    }
//}
