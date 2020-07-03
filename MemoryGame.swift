//
//  MemoryGame.swift
//  Model architecture.
//  Memorize
//
//  Created by Matin Massoudi on 7/2/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

//Import functional libraries.
import Foundation

//Structs are go to data structure.
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card){
        print("Card Chosen!\(card)")
    }
    
    //Initialization method takes in function as parameter pass.
    init(numberOfPairsOfCards: Int, cardContentFunc: (Int) -> CardContent){
        //init with empty array.
        cards = Array<Card>()
        
        //Iterate based on numberOfCards, create two Card entities and add them to Cards array.
        for i in 0..<numberOfPairsOfCards {
            let content = cardContentFunc(i)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    //Nested 'card' struct.
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}


