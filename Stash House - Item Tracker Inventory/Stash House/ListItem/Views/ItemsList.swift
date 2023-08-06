//
//  ItemsList.swift
//  Stash House
//
//  Created by Justin Trubela on 7/19/23.
//

import SwiftUI

//struct ItemsList: View {
//    //Testing system Item
//    @State private var itemCollections: [collection] = []
//    
//    struct collection: Codable, Hashable{
//        let name: String
//    }
//    
//    let items: [Console]
//    var fileName: String
//            
//    var decoder = JSONBundleDecoder<collection>(fileName: "VideoGame")
//
//    var body: some View{
//        NavigationStack{
//            VStack{
//                //List the items
//                List(items, id: \.name){ item in
//                    NavigationLink{
//                        VStack{
//                            Text("\(item.name)")
//
//                            NavigationLink{
//                                Text(item.name)
//                            } label: {
//
//                                Text("My items")
//                            }
//
//                        }
//                    } label: {
//                        Text(item.name)
//                    }
//                }
//            }
//            .onAppear {
//                itemCollections = decoder.decodeJSON()
//            }
//            .navigationTitle("My Stash")
//
//        }
//    }
//}
//struct ItemsList_Previews: PreviewProvider {
//    struct Consoles: Hashable, Codable {
//        var name: String
//        var manufacturer: String
//        var releaseYear: Int
//        
//        var formattedReleaseYear: String {
//            return "\(releaseYear)"
//        }
//    }
//    static var previews: some View {
//        ItemsList(items: [Consoles])
//    }
//}
