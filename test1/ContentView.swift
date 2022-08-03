//
//  ContentView.swift
//  test1
//
//  Created by 송인제 on 2022/06/30.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😍", "😡", "😳", "🫥", "😪", "😦", "👉", "👋", "🫵", "🤌", "🫦", "🦶", "👤", "👨‍🦲", "👨‍🚒", "🧑‍💻", "👨‍🎨", "🧑‍🔬", "🤵‍♂️"]
    
    @State var emojiCount = 4
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1{
                emojiCount -= 1
            }
        }, label:{
            VStack{
                Image(systemName: "minus.circle")
            }
        })
    }
    var add: some View{
        Button(action: {
            if emojiCount < emojis.count{
            emojiCount += 1
            }
        }, label:{
            VStack{
                Image(systemName: "plus.circle")
            }
        })
    }
}

struct CardView : View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp{
                shape.fill()
                    .foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme (.dark)
    }
}
