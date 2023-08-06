//
//  Stash_HouseApp.swift
//  Stash House
//
//  Created by Justin Trubela on 6/30/23.
//

import SwiftUI

@main
struct Stash_HouseApp: App {
    var body: some Scene {
        WindowGroup {
            CardsList()
        }
    }
}


protocol CardList {
    func addCard(_ card: String)
    func removeCard(_ card: String)
    func displayList()
}

class BaseballCardList: CardList {
    private var cards: [String] = []
    
    func addCard(_ card: String) {
        cards.append(card)
    }
    
    func removeCard(_ card: String) {
        if let index = cards.firstIndex(of: card) {
            cards.remove(at: index)
        }
    }
    
    func displayList() {
        for card in cards {
            print(card)
        }
    }
}

class ListFactory {
    static func createList(type: String) -> CardList {
        switch type {
            case "baseball":
                return BaseballCardList()
            default:
                fatalError("Unsupported list type")
        }
    }
}


struct listItemCard: View {
    
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .fill(.secondary)
                    .cornerRadius(5)
                    .opacity(0.10)
                    .frame(width: 180, height: 275)
                    .padding()
                HStack{
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct listItem_Previews: PreviewProvider {
    static var previews: some View {
        listItemCard()
    }
}






struct listItem: Identifiable, Hashable, Equatable {
    var id: UUID = .init()
    var image: String
    var previousOffset: CGFloat = 0
}




struct listItemStack: View {
    
    
    
    @State private var images: [listItem] = [
        .init(image:"RogerClemens"),
        .init(image:"RogerClemens"),
        .init(image:"questionmark.folder.fill"),
        .init(image:"scooter"),
        .init(image:"trash"),
        .init(image:"photo.stack"),
        .init(image:"questionmark.folder.fill"),
        .init(image:"scooter"),
        .init(image:"trash"),
        .init(image:"photo.stack"),
        .init(image:"questionmark.folder.fill"),
        .init(image:"scooter"),
        .init(image:"trash")
    ]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: true) {
                
                LazyHStack{
                    ForEach(images) { image in
                        listItemCard().overlay {
                            CardView(image)
                            
                        }
                    }
                }
            }
        }
    }
}

@ViewBuilder
func CardView(_ listItem: listItem) -> some View {
    GeometryReader { proxy in
        let size = proxy.size
        
        Image(listItem.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
        
    }
    .frame(width: 100, height: 200)
}
struct listItemStack_Previews: PreviewProvider {
    static var previews: some View {
        listItemStack()
    }
}

