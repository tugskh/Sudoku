//
//  SudokuBoardView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct SudokuBoardView: View {
    
    @EnvironmentObject var sudoku: Sudoku
    
    
    var body: some View {
        
        VStack {
            VStack(spacing: 0) {
                ForEach(0 ..< 9) { row in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 9) { col in
                            if(sudoku.activeCell == [row, col]) {
                                SudokuCell(number: sudoku.valueAt(row: row, col: col))
                                    .border(.black, width:1.2)
                            } else {
                                SudokuCell(number: sudoku.valueAt(row: row, col: col))
                                    .onTapGesture {
                                        if(sudoku.isEmpty(row: row, col: col) && !sudoku.isCorrect(row: row, col: col)) {
                                            sudoku.activeCell = [row,col]
                                        }
                                        print(sudoku.activeCell)
                                    }
                            }
                        }
                    }
                }
            }
            .aspectRatio(1.0, contentMode: .fit)
            .padding()
        }
    }
}

struct SudokuBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuBoardView().environmentObject(Sudoku())
    }
}

struct SudokuCell: View {
    
    let number: Int?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
//                .frame(width: 30, height: 30)
                .border(.indigo)
            
            if number != 0 {
                Text("\(number!)")
            }
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
