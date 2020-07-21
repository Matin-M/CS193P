//
//  EmojiMemoryGame.swift
//  Memorize Viewmodel
//
//  Created by Matin Massoudi on 7/2/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

import SwiftUI


//class because it can be shared.
class EmojiMemoryGame: ObservableObject {
    //Only class can modify, but is accessible elsewhere.
    //Function inlining.
    
    //Published keyword calls change.send when model is changed.
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis = [["👻","🎃","🐓","😃","😆"],["A","B","C","D","E"]]
        emojis = emojis.shuffled()
        //Pick a random theme.
        let randomTheme: Int = Int.random(in: 0..<2)
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 1..<6), cardContentFunc: {
            //Closure param: pairIndex. closure return type: String.
            pairIndex in
            emojis[randomTheme][pairIndex]
        })
            
    }
    
    
    //MARK: -Access methods to private model data.
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card)
    {
        objectWillChange.send()
        model.choose(card: card)
    }
    
    //Resets game by redeclaring local NewGame Func.
    func resetGame() -> Void {
        objectWillChange.send()
        model = EmojiMemoryGame.createMemoryGame()
    }
}
