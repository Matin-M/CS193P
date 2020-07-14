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
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    var indexOfFaceUp: Int? {
        get {
            var faceUpCardsIndicies = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp{
                    faceUpCardsIndicies.append(index)
                }
            }
            if faceUpCardsIndicies.count == 1 {
                return faceUpCardsIndicies.first
            }else{
                return nil
            }
        }
        set {
            for index in cards.indices{
                if index == newValue{
                    cards[index].isFaceUp = true
                }else {
                    cards[index].isFaceUp = false
                }
            }
        }
    }
    
    //Functions that modify 'self' utilized in structs.
    mutating func choose(card: Card){
        print("Card Chosen!\(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp,
        !cards[chosenIndex].isMatched{
            
            if let potentialMatchIndex = indexOfFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFaceUp = chosenIndex
            }
            
            
        }
    }
    

    
    
    //Initialization method takes in function as parameter pass.
    init(numberOfPairsOfCards: Int, cardContentFunc: (Int) -> CardContent){
        //initialize with empty array.
        cards = Array<Card>()
        //Iterate based on numberOfCards, create two Card entities and add them to Cards array.
        for i in 0..<numberOfPairsOfCards {
            let content = cardContentFunc(i)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: i*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: i*2+1))
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


