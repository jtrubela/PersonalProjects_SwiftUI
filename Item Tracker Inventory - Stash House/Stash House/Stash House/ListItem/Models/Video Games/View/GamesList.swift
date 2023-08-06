//
//  Games.swift
//  Stash House
//
//  Created by Justin Trubela on 7/19/23.
//

import SwiftUI


struct GamesList: View {
    let console: Console
    
    @State private var games: [Game] = []
    
    var body: some View{
        VStack{
            //List the items
            List(console.games, id: \.name){ game in
                NavigationLink{
                    VStack{
                        Text(game.name)
                        Text(game.console)
                        Text("\(game.formattedReleaseYear)")
                    }
                } label: {
                    Text(game.name)
                }
            }
        }
    }
}

struct GamesList_Previews: PreviewProvider {
    static var previews: some View {
        @State var games: [Game] = [
            .init(name: "Game1", console: "Playstation", releaseYear: 2000)
        ]
        @State var consoles: [Console] = [
            .init(name: "Playstation", manufacturer: "Sony", releaseYear: 2000, games: games)
        ]
        NavigationStack{
            GamesList(console: consoles[0])
        }
        
    }
}
