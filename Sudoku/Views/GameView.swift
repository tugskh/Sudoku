//
//  GameView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/21/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dm: Sudoku
    @State private var pauseMenu = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView() {
            ZStack {
                VStack() {
                    SudokuBoardView().environmentObject(dm)
                    KeyPadView().environmentObject(dm)
                        .padding(.bottom)
                        .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("\(dm.mode?.rawValue ?? "mode")".capitalized)
                            .bold()
                            .font(.title2)
                            .fontDesign(.serif)
                    }
                    ToolbarItem {
                        Text("\(dm.wrong_try)/3")
                            .font(.title2)
                            .fontDesign(.serif)
                            .bold()
                    }
                    ToolbarItem {
                        Button {
                            pauseMenu = true
                        } label: {
                            Image(systemName: "pause.fill")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                        
                    }
                }
                
                if(pauseMenu) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                        VStack {
                            Text("Paused").bold().font(.title)
                            Button("Resume") {
                                pauseMenu = false
                            }
                                .foregroundColor(.white)
                                .background(.indigo)
                                .clipShape(Capsule())
                                .padding()
                            Button("Restart") {
                                pauseMenu = false
                                dm.cells = dm.system_cells
                                dm.wrong_try = 0
                                dm.activeCell = []
                            }
                                .foregroundColor(.white)
                                .background(.indigo)
//                                .controlSize(.small)
                                .clipShape(Capsule())
                            Button("Exit"){
                                self.dismiss()
                            }
                                .foregroundColor(.white)
                                .background(.indigo)
//                                .controlSize(.small)
                                .clipShape(Capsule())
                        }
                        .fontDesign(.serif)
                        .buttonStyle(.bordered)
                    }
                }
                
                if(dm.gameOver) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                        VStack {
                            if(dm.wrong_try != 3) {
                                Text("You Won!")
                                    .bold()
                                    .font(.title2)
                                    .padding()
                            } else {
                                Text("Game Over")
                                    .transition(.move(edge: .bottom))
                                    .bold()
                                    .font(.title2)
                                    .padding()
                                    .animation(.easeIn, value: dm.gameOver)
                            }
                            Button("Exit"){
                                self.dismiss()
                            }
                                .foregroundColor(.white)
                                .background(.indigo)
                                .clipShape(Capsule())
                        }
                        .fontDesign(.serif)
                        .buttonStyle(.bordered)
                    }
                }
            }
        }

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Sudoku())
    }
}
