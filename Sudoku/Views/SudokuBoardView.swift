//
//  SudokuBoardView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct SudokuBoardView: View {
    
    @EnvironmentObject var sudoku: Sudoku
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                ForEach(0 ..< 3) { row in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 3) { col in
                            Rectangle()
                                .fill(.clear)
                                .border(.indigo, width: 1.7)
                        }
                    }
                }
            }
                .border(.indigo, width: 3)
            
            VStack(spacing: 0) {
                ForEach(0 ..< 9) { row in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 9) { col in
                            SudokuCellView(row: row, col: col).environmentObject(sudoku)
                        }
                    }
                }
            }
            
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

struct SudokuBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuBoardView().environmentObject(Sudoku())
    }
}

