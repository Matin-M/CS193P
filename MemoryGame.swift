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
    private(set) var cards: Array<Card>
    
    private var indexOfOnlyFaceUp: Int? {
        get {
            //Stores all faceup cards in array.
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
            
            //New value is the new assigned int to indexOfOnlyFaceUp
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
        
        print("Card Chosen! \(card)")
        //See if chosen card is not faceup and is not matched yet.
        if let chosenIndex: Int = cards.firstIndex(matching: card), cards[chosenIndex].isFaceUp == false,
        cards[chosenIndex].isMatched == false{
            
            //
            if let potentialMatchIndex = indexOfOnlyFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOnlyFaceUp = chosenIndex
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


