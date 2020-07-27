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
    //When viewModel change method is invoked, view is redrawn.
    @ObservedObject var viewModel: EmojiMemoryGame = EmojiMemoryGame()
    
    //Computed vars like body are not stored in memory.
    var body: some View{
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5).onTapGesture {
                    print("New Game Button Clicked")
                    self.viewModel.resetGame()
                }
                Text("New Game").colorInvert()
            }.frame(width: 100, height: 50)
            Grid (viewModel.cards, viewForItem: {card in
                    CardView(card: card).onTapGesture(perform: {
                        self.viewModel.choose(card: card)
                        }).padding(5)
                    
                    //Setting environment for all elements in zstack.
            }).foregroundColor(Color.orange).padding()
        }
        
        

    }

}

/**
 CardView function generates rectangular elements containing emojis.
 */
struct CardView: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack{
            if card.isFaceUp == true{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else{
                if card.isMatched == false{
                    backCardView()
                }
                
            }
            
        }
            //Geometry variable contains height/width information of view.
            //Scaling down to 75% size in order to avoid clipping.
        .font(Font.system(size: min(size.width, size.height) * fontScaleFactor ))
    }
    
    //MARK: - Drawing Constants:
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
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
