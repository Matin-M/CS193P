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
struct ContentView: View {
    //Views are rectangular areas on the screen.
    //Some signifies any struct as long as it behaves like view struct.
    //Computed vars like body are not stored in memory.
    var body: some View{
        return HStack(spacing: 4) {
            ForEach(0..<4, content: {_ in
                //Return statements assumed.
                CardView(isFaceUp: true)
                
                //Setting environment for all elements in zstack.
                })
            }.foregroundColor(Color.orange).padding().font(Font.largeTitle)

    }

}

struct CardView: View{
    //Since no init method, all properties must be initialized.
    var isFaceUp: Bool
    var body: some View{
        ZStack{
            if isFaceUp == true{
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 4)
                Text("🐔")
            }
            else{
                backCardView()
            }
            
        }
    }

}

struct backCardView: View{
    var body: some View{
        return RoundedRectangle(cornerRadius: 20.0).fill(Color.orange)
    }
}




//Function that binds code and preiew.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
