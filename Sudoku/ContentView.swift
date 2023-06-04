//
//  ContentView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Sudoku :)")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                NavigationLink(destination: ModeView()) {
                    Text("Play")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
                .background(.indigo)
                .clipShape(Capsule())
            }
            .fontDesign(.serif)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModeView: View {
    
    @State private var mode = ""
    let modes: [String] = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        VStack{
            Text("Choose difficulty:")
                .bold()
                .font(.largeTitle)
                .padding()
            ForEach(modes, id: \.self) { mode in
                NavigationLink(destination: SudokuBoardView(mode: $mode)) {
                    Text(mode)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    self.mode = mode
                })
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.indigo)
            .clipShape(Capsule())
                
        }
        .fontDesign(.serif)
    }
}


