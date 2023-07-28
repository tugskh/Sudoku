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
        
        ZStack {
            
            VStack(spacing: 0) {
                ForEach(0 ..< 3) { _ in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 3) { col in
                            Rectangle()
                                .fill(.clear)
                                .border(.indigo, width: 1.7)
                        }
                    }
                }
            }.border(.indigo, width: 2)
            
            VStack(spacing: 0) {
                ForEach(0 ..< 9) { row in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 9) { col in
                            if(sudoku.activeCell == [row, col]) {
                                SudokuCellView(number: sudoku.valueAt(row: row, col: col), color: sudoku.cellColor(row: row, col: col)).border(.black, width: 2)
                            } else {
                                SudokuCellView(number: sudoku.valueAt(row: row, col: col), color: sudoku.cellColor(row: row, col: col))
                                    .onTapGesture {
                                        sudoku.setActiveCell(row: row, col: col)
                                        print(sudoku.activeCell)
                                    }
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

struct SudokuBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuBoardView().environmentObject(Sudoku())
    }
}

