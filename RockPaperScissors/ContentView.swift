//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Juliette Rapala on 9/28/20.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    @State private var playersChoice = "Rock"
    @State private var computersChoice = "Scissors"
    @State private var winOrLose = "win"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("You \(winOrLose == "win" ? "Win!" : "Lose!")")
                    .modifier(VeryLargeTextModifier())
                    .frame(height: 300)
                
                VStack(spacing: 50) {
                    VStack(spacing: 10) {
                        Text("You picked:")
                            .modifier(SmallTextModifier())
                        
                        Text("\(playersChoice)")
                            .modifier(LargeTextModifier())
                    }
                    
                    VStack(spacing: 10) {
                        
                        Text("The app picked:")
                            .modifier(SmallTextModifier())

                        Text("\(computersChoice)")
                            .modifier(LargeTextModifier())
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button("Rock") {
                        self.playersChoice = options[0]
                    }
                    .modifier(ButtonModifier())

                    
                    Button("Paper") {
                        self.playersChoice = options[1]
                    }
                    .modifier(ButtonModifier())
                    
                    Button("Scissors") {
                        self.playersChoice = options[2]
                    }
                    .modifier(ButtonModifier())
                    
                    Spacer()
                }
                .frame(minHeight: 300)

            }
        }
        
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 50, maxHeight: 100, alignment: .center)
            .background(Color(#colorLiteral(red: 0.282229086, green: 0.1790652775, blue: 0.5, alpha: 1)))
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct SmallTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
    }
}

struct LargeTextModifier: ViewModifier {
    let font = Font.system(.title).weight(.bold)
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(font)
    }
}

struct VeryLargeTextModifier: ViewModifier {
    let font = Font.system(size: 80).weight(.bold)
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(font)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
