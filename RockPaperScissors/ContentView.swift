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
    @State private var computersChoiceInt = Int.random(in: 0...2)
    @State private var resultDisplay = "You win!"
    @State private var showComputerResult = false
    @State private var showResultDisplay = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text(showResultDisplay ? "\(resultDisplay)" : " ")
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

                        Text(showComputerResult ? "\(options[computersChoiceInt])" : " ")
                            .modifier(LargeTextModifier())
                    }
                }
                
                Spacer()
                    .frame(height: 50)
                
                HStack {
                    Spacer()
                    
                    Button("Rock") {
                        self.playersChoice = options[0]
                        determineWinner()
                    }
                    .modifier(ButtonModifier(isDisabled: showResultDisplay))
                    .disabled(showResultDisplay)

                    
                    Button("Paper") {
                        self.playersChoice = options[1]
                        determineWinner()
                    }
                    .modifier(ButtonModifier(isDisabled: showResultDisplay))
                    .disabled(showResultDisplay)
                    
                    Button("Scissors") {
                        self.playersChoice = options[2]
                        determineWinner()
                    }
                    .modifier(ButtonModifier(isDisabled: showResultDisplay))
                    .disabled(showResultDisplay)
                    
                    Spacer()
                }
                
                VStack() {
                    Button("Start a New Game") {
                        self.newGame()
                    }
                    .modifier(SmallButtonModifier(isDisabled: !showResultDisplay))
                    .disabled(!showResultDisplay)
                }

            }
        }
    }
    
    func newGame() {
        showComputerResult = false
        showResultDisplay = false
        playersChoice = " "
        computersChoiceInt = Int.random(in: 0...2)
    }
    
    func determineWinner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showComputerResult = true
        }
        
        let computersChoice = options[computersChoiceInt]
        
        if (playersChoice == "Rock") {
            if (computersChoice == "Rock") {
                resultDisplay = "Tie!"
            } else if (computersChoice == "Paper") {
                resultDisplay = "You Lose!"
            } else {
                resultDisplay = "You Win!"
            }
        } else if (playersChoice == "Paper") {
            if (computersChoice == "Rock") {
                resultDisplay = "You Win!"
            } else if (computersChoice == "Paper") {
                resultDisplay = "Tie!"
            } else {
                resultDisplay = "You Lose!"
            }
        } else {
            if (computersChoice == "Rock") {
                resultDisplay = "You Lose!"
            } else if (computersChoice == "Paper") {
                resultDisplay = "You Win!"
            } else {
                resultDisplay = "Tie!"
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            showResultDisplay = true
        }
        
        
    }
}

struct ButtonModifier: ViewModifier {
    let isDisabled: Bool
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 50, maxHeight: 100, alignment: .center)
            .background(Color(#colorLiteral(red: 0.282229086, green: 0.1790652775, blue: 0.5, alpha: 1)))
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .opacity(isDisabled ? 0.5 : 1)
    }
}

struct SmallButtonModifier: ViewModifier {
    let isDisabled: Bool

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(maxWidth: 200, maxHeight: 40, alignment: .center)
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            .offset(y: 20)
            .opacity(isDisabled ? 0.25 : 1)
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
