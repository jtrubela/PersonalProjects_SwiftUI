//
//  CardsList.swift
//  Stash House
//
//  Created by Justin Trubela on 7/14/23.
//

//List of Topps Baseballcards
// 88' Topps Chewing Gum
// 792 cards


import SwiftUI

struct CardsList: View {
    //Array of Baseballcards
    @State private var cards: [Topps88CGCard] = []
    //JSON Decoder
    var decoder = JSONBundleDecoder<Topps88CGCard>(fileName: "Topps88CG")
      
    var body: some View {
        
        NavigationStack {
            VStack {
                List(cards, id: \.cardNumber) { card in
                    NavigationLink {
                        CardListInfoView(card: card, title: card.cardTitle, cardNumber: card.cardNumber)
                        
                    } label: {
                        CardListItemView(card: card)
                    }
                }
                .navigationTitle("Topps 88' Baseball")
            }
            .onAppear {
                //decodes the topps 88 cards
                cards = decoder.decodeJSON()
            }
        }
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList()
    }
}


