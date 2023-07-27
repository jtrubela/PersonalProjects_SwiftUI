//  Consoles.swift
//  Stash House
//
//  Created by Justin Trubela on 7/19/23.
//

import SwiftUI

//struct VideoGamesList: View {
//    var body: some View{
//        ItemsList(items: Console)
//    }
//}
//struct VideoGamesList_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoGamesList()
//    }
//}

struct VideoGameConsolesListView: View {
    //Testing system Item
    @State private var VideoGameConsoles: [Console] = [Console(name: "Test", manufacturer: "Test", releaseYear: 1990, games: [Game(name: "Test", console: "test", releaseYear: 1990)])]
//TODO: GET THIS GENERIC ITEMS LIST TO POPULATE BASED ON COLLECTION AND FILE NAME GIVEN
    //THIS IS NEEDED TO SEND IN THE COLLECTION TYPE
//    var VideoGameConsoless: [Console]
    @State private var games: [Game] = []
    
    //MARK: Generic struct to handle any kind of list item
        //will ask for an Item and will be used in the lists
        //each item must be identifiable and hashable
    
    //Decoder for the system json
    var decoder = JSONBundleDecoder<Console>(fileName: "VideoGame")
    
    
    var body: some View{

//TODO: GET THIS GENERIC ITEMS LIST TO POPULATE BASED ON COLLECTION AND FILE NAME GIVEN
//        ItemsList(items: [], fileName: "VideoGame")
        
        
        NavigationStack{
            VStack{
                //List the items

                List(VideoGameConsoles, id: \.name){ console in
                    NavigationLink{
                        VStack{
                            Text("\(console.name)")
                            Text("Manufactured by \(console.manufacturer)")
                            Text("Year Released: \(console.formattedReleaseYear)")
                            Text("Games owned: \(console.games.count)")
                            Spacer()
                            NavigationLink{
                                GamesList(console: console)
                            } label: {

                                Text("My Games")
                            }
                            Spacer()
                        }
                    } label: {
                        Text(console.name)
                    }
                }
            }
            .navigationTitle("Video Game Stash")
            .onAppear {
                VideoGameConsoles = decoder.decodeJSON()
            }
        }
    }
}


struct VideoGameConsolesListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoGameConsolesListView()
    }
}
