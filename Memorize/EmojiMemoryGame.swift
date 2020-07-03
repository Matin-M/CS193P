//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Matin Massoudi on 7/2/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

import SwiftUI

//class because it can be shared.
class EmojiMemoryGame {
    //Only class can modify, but is accesible elsewhere.
    private var model: MemoryGame<String> = MemoryGame<String>(cards: <#T##Array<MemoryGame<String>.Card>#>)
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card)
    {
        model.choose(card: card)
    }
}
