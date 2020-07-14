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
    
    //Functions that modify 'self' utilized in structs.
    mutating func choose(card: Card){
        print("Card Chosen!\(card)")
        let chosenIndex: Int = cards.firstIndex(matching: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    

    
    
    //Initialization method takes in function as parameter pass.
    init(numberOfPairsOfCards: Int, cardContentFunc: (Int) -> CardContent){
        //initialize with empty array.
        cards = Array<Card>()
        //Iterate based on numberOfCards, create two Card entities and add them to Cards array.
        for i in 0..<numberOfPairsOfCards {
            let content = cardContentFunc(i)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: i*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: i*2+1))
        }
        
        //Shuffle cards. 
        cards = cards.shuffled()
    }
    
    
    //Nested 'card' struct.
    //Identifiable protocol gives struct identifiable property for iterations.
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}


