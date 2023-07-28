//
//  ContentView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dm: Sudoku
    
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
        ContentView().environmentObject(Sudoku())
    }
}

struct ModeView: View {
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var dm: Sudoku
    
    
    var body: some View {
        VStack{
            Text("Choose difficulty:")
                .bold()
                .font(.largeTitle)
                .padding()
            
            ForEach(modes.allCases, id: \.id) { mode in
                NavigationLink(destination: GameView().navigationBarBackButtonHidden()) {
                    Text(mode.rawValue.capitalized)
//                    Button(mode.rawValue.capitalized) {
//                        dm.mode = mode
//                    }
                }
                .simultaneousGesture(TapGesture().onEnded{
                    dm.mode = mode
                    dm.startGame()
                })
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.indigo)
            .clipShape(Capsule())
                
        }
        .navigationBarBackButtonHidden(true)
        .fontDesign(.serif)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.indigo)
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
            }
        }
    }
}


