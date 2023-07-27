//
//  ListItem.swift
//  Stash House
//
//  Created by Justin Trubela on 7/18/23.
//

import Foundation

////  Item protocol is updated to inherit from IdentifiableItem and Hashable, providing the id property automatically to conforming types.
//protocol IdentifiableItem: Identifiable {
//    var id: UUID { get }
//}
//
//
//// Item protocol to define common properties for different item types
//protocol Item: Hashable, IdentifiableItem {
//    var name: String { get }
//}
//
//
//class ListMaker {
//    var lists: [[any Item]]
//    
//    init() {
//        lists = []
//    }
//    
//    func addList(_ listItems: [any Item]) {
//        lists.append(listItems)
//    }
//    
//    func removeList(at index: Int) {
//        guard index >= 0 && index < lists.count else {
//            return
//        }
//        
//        lists.remove(at: index)
//    }
//    
//    func printLists() {
//        for (index, list) in lists.enumerated() {
//            print("List \(index + 1):")
//            for (itemIndex, item) in list.enumerated() {
//                print("    \(itemIndex + 1). \(item.name)")
//            }
//        }
//    }
//}
//
