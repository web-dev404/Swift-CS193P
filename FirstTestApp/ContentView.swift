import SwiftUI

struct ContentView: View {
    let cardsList = ["A", "B", "C", "D", "E", "F", "G"]
    
    @State var cardCount: Int = 2
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            
            Spacer()
            
            HStack {
                cardAdder
                Spacer()
                cardRemover
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(cardText: cardsList[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > cardsList.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: +1, symbol: "plus")
    }
}

struct CardView: View {
    let cardText: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(cardText).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
