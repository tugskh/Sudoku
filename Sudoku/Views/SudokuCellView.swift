//
//  SudokuCellView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/26/23.
//

import SwiftUI

struct SudokuCellView: View {
    
    @EnvironmentObject var dm: Sudoku
    @Environment(\.colorScheme) var colorScheme
    
    
    var row : Int
    var col: Int
//    var color: Color
    
    var body: some View {
        
            ZStack {
                if(dm.activeCell != [] && dm.activeCell[0] == row && dm.activeCell[1] == col) {
                    Rectangle()
                        .fill(dm.cellColor(row: row, col: col))
                        .border(colorScheme == .dark ? .white : .black, width: 2)
                }
                else {
                    Rectangle()
                        .fill(dm.cellColor(row: row, col: col))
                        .border(.indigo)
                }
                
                if dm.valueAt(row: row, col: col) != 0 {
                    Text("\(dm.valueAt(row: row, col: col))")
                        .bold(dm.systemCell(row: row, col: col))
    //                Text("\(number2)")

                } else {
                    CellNoteView(row: row, col: col).environmentObject(dm)
                        .frame(alignment: .center)
                        .padding(3)
                        .fixedSize()
                }
            }
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .onTapGesture {
                dm.activeCell = [row, col]
            }
    }

}

struct SudokuCellView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuCellView(row: 1, col: 1).environmentObject(Sudoku())
    }
}
