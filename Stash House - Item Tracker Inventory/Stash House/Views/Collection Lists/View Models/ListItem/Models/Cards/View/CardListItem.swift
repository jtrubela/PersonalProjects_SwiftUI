//
//  CardListItem.swift
//  Stash House
//
//  Created by Justin Trubela on 7/17/23.
//

import SwiftUI

struct CardListItemImage: View {
    let image: Image?
    
    var body: some View{
        ZStack{
            Rectangle()
                .fill(.gray)
                .cornerRadius(5)
                .frame(width: 80, height: 130)
                .overlay {
                    image
                }
        }
    }
}
struct CardListItemImage_Previews: PreviewProvider {
    static var previews: some View {
        CardListItemImage(image: Image(systemName:"trash.fill"))
        
    }
}

struct CardListItemInfo: View {
    let card: Topps88CGCard
    let cardTitle: String
    let cardNumber: Int
    
    var body: some View {
        HStack{
            
            CardListItemImage(image: nil)
            
            VStack(alignment: .leading) {
                Section{
                    Text("\(card.cardTitle)")
                        .font(.headline)
                }
                
                Section{
                    HStack{
                        Text("#")
                        Text("\(card.cardNumber)")
                            .bold()
                    }
                    .font(.subheadline)
                    
                }
            }
            .padding()
        }
    }
}

struct CardListItemInfo_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            CardListItemInfo(card: Topps88CGCard(cardNumber: 1, cardTitle: "testing 1"), cardTitle: "MY TEST", cardNumber: 999)
        }
    }
}

struct CardListItemView: View {
    let card: Topps88CGCard
    
    var body: some View {
        HStack{
            CardListItemInfo(card: card, cardTitle: card.cardTitle, cardNumber: card.cardNumber)
        }
    }
}
struct CardListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            CardListItemImage(image: Image(systemName:"trash.fill"))
                .padding(10)
//            CardListItemInfo(card: Topps88CGCard(cardNumber: 1, cardTitle: "testing 1"), cardTitle: "MY TEST", cardNumber: 999)
            CardListItemView(card: Topps88CGCard(cardNumber: 1, cardTitle: "testing 1"))
        }
    }
}

struct CardListInfoView: View {
    let card: Topps88CGCard
    let title: String
    let cardNumber: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Section{
                Text("\(card.cardTitle)")
                    .font(.headline)
            }
            
            Section{
                HStack{
                    Text("#")
                    Text("\(card.cardNumber)")
                        .bold()
                }
                .font(.subheadline)
                
            }
        }
        .padding()
    }
}
struct CardListInfoView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HStack{
                CardListItemImage(image: Image(systemName:"trash.fill"))
                    .padding(10)
                CardListItemInfo(card: Topps88CGCard(cardNumber: 1, cardTitle: "testing 1"), cardTitle: "MY TEST", cardNumber: 999)
            }
            ZStack{
                
                CardListItemView(card:  Topps88CGCard(cardNumber: 1, cardTitle: "testing 1"))
                CardListItemImage(image: Image(systemName:"trash.fill"))
            }
        }
    }
}