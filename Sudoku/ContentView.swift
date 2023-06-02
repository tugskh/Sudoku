//
//  ContentView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSheet = false
    var body: some View {
        VStack {
            
            Text("Sudoku :)")
                .bold()
                .font(.title)
                .padding()
            
            Button("Play") {
                isShowingSheet = true
//                print(isShowingSheet)
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.indigo)
            .clipShape(Capsule())
            .sheet(isPresented: $isShowingSheet) {
                
                VStack {
                    Text("Choose difficulty:")
                        .bold()
                        .font(.title)
                        .padding()
                    
                    Button("Easy") {
                        
                    }
                    .foregroundColor(.white)
                    .background(.indigo)
                    .clipShape(Capsule())
                    
                    Button("Medium") {
                        
                    }
                    .foregroundColor(.white)
                    .background(.indigo)
                    .clipShape(Capsule())
                    
                    Button("Hard") {
                        
                    }
                    .foregroundColor(.white)
                    .background(.indigo)
                    .clipShape(Capsule())
                }
                .buttonStyle(.bordered)
                .presentationDetents([.fraction(0.3)])
                
            }
        }
        .fontDesign(.serif)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
