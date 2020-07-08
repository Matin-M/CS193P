//
//  EmojiMemoryGame.swift
//  Memorize Viewmodel
//
//  Created by Matin Massoudi on 7/2/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

import SwiftUI


//class because it can be shared.
class EmojiMemoryGame {
    //Only class can modify, but is accessible elsewhere.
    //Function inlining.
    
    //Create memory is a type, using dot notation via class name.
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = ["👻","🎃","🐓","😃","😆"]
        emojis = emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 0..<6), cardContentFunc: {
            //Closure param: pairIndex. closure return type: String.
            pairIndex in
            emojis[pairIndex]
        })
            
        
    }
    
    //MARK: -Access methods to private model data.
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card)
    {
        model.choose(card: card)
    }
}
