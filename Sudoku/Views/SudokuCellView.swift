//
//  SudokuCellView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/26/23.
//

import SwiftUI

struct SudokuCellView: View {
    
    var number: Int
    var color: Color
    
    var body: some View {
        
            ZStack {
                Rectangle()
                    .fill(color)
                    .border(.indigo)
                
                if number != 0 {
                    Text("\(number)")
    //                Text("\(number2)")

                }
            }
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

}

struct SudokuCellView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuCellView(number:2, color: .clear)
    }
}
