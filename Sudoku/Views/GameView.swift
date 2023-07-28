//
//  GameView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/21/23.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var dm: Sudoku
//    var dm: Sudoku
//
//    init(gameMode: modes) {
//        self.gameMode = gameMode
//        dm = Sudoku(mode: gameMode)
//    }

    var body: some View {
        VStack {
//            Text("\(dm.mode.rawValue)"+" \(dm.id)")
//            Text("\(dm.id)")
            
//            SudokuBoardView(sudoku: dm)
            SudokuBoardView().environmentObject(dm)
            KeyPadView().environmentObject(dm)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Sudoku())
    }
}
