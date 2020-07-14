//
//  Grid.swift
//  Memorize
//
//  Created by Matin Massoudi on 7/14/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

import SwiftUI

//Generic where clause, Item must conform to Identifiable protocol.
//Generic where clauses constrain generics.
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    //Function escapes from init.
    init(_ item: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = item
        self.viewForItem = viewForItem
        
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
            }
        }
        
        
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
    func index(of item: Item) -> Int {
        for index in 0..<items.count {
            if items[index].id == item.id {
                return index
            }
        }
        
        return 0
    }
}


