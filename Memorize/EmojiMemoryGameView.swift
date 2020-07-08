//
//  ContentView.swift
//  Memorize
//
//  Created by Matin Massoudi on 6/30/20.
//  Copyright © 2020 Matin Massoudi. All rights reserved.
//

//Import SwiftUI package.
import SwiftUI

var newText: Text = Text("Hello!!")

//Inherets view properties.
//Views are rectangular areas on the screen.
//Some signifies any struct as long as it behaves like view struct.
struct EmojiMemoryGameView: View {
    
    //ViewModel local object.
    var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    //Computed vars like body are not stored in memory.
    var body: some View{
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
            ForEach(viewModel.cards, content: {card in
                
                
                if (self.viewModel.cards.count >= 5) {
                    CardView(card: card).onTapGesture(perform: {
                    self.viewModel.choose(card: card)
                    })
                }
                else {
                    CardView(card: card).onTapGesture(perform: {
                    self.viewModel.choose(card: card)
                    }).font(Font.largeTitle)
                }
                
                //Setting environment for all elements in zstack.
                })
            }
        }.foregroundColor(Color.orange).padding()
        

    }

}

/**
 CardView function generates rectangular elements containing emojis.
 */
struct CardView: View{
    //Since no init method, all properties must be initialized.
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            if card.isFaceUp == true{
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 4)
                Text(card.content)
            }
            else{
                backCardView()
            }
            
        }
    }

}

/**
 backCardView generates flipped card.
 */
struct backCardView: View{
    var body: some View{
        return RoundedRectangle(cornerRadius: 20.0).fill(Color.orange)
    }
}




//Function that binds code and preiew.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
