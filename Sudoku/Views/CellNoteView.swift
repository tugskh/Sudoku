//
//  CellNoteView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/31/23.
//

import SwiftUI

struct CellNoteView: View {
    
    @EnvironmentObject var dm: Sudoku
    var row: Int
    var col: Int
    
    var body: some View {
        
        VStack(alignment: .center) {
            ForEach(1 ..< 4) { r in
                HStack(alignment: .center) {
                    ForEach(1 ..< 4) { c in
                        if(dm.cellNotes[row][col].contains(c+3*r-3)) {
                            Text("\(c+(3*(r-1)))")
                                .font(.system(size: 10))
                                .bold(dm.valueAt(row: dm.activeCell[0], col: dm.activeCell[1]) == c+3*r-3)
                                .foregroundColor(dm.valueAt(row: dm.activeCell[0], col: dm.activeCell[1]) == c+3*r-3 ? .black : .gray)
                                .padding(EdgeInsets(top: -5, leading: -3, bottom: -3, trailing: -1))
                        }
                        else {
                            Text("  ")
                                .font(.system(size: 8))
                                .padding(EdgeInsets(top: -5, leading: -3, bottom: -3, trailing: -1))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct CellNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CellNoteView(row: 1, col: 1).environmentObject(Sudoku())
    }
}


