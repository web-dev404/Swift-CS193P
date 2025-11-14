import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.blue)
            Text("KAIF RESIDENCE")
        }
        .padding()
        HStack(spacing: 20) {
            CardView(isFaceUp: true)
            CardView()
            Image(systemName: "phone")
                .imageScale(.small)
            Text("PHONE NUMBER")
        }
        .padding(10)
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text("YO").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}

