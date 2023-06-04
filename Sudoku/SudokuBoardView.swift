//
//  SudokuBoardView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

struct SudokuBoardView: View {
    
    @Binding var mode: String
    
    var body: some View {
        
        VStack {
            Text(mode)
            VStack(spacing: 0) {
                ForEach(0 ..< 9) { _ in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 9) { _ in SudokuCell(number: Int.random(in: 1 ..< 10))
                        }
                    }
                }
            }
            .frame(width: 270, height: 270)
        }
    }
}

struct SudokuBoardView_Previews: PreviewProvider {
    static var previews: some View {
        SudokuBoardView(mode: .constant("Easy"))
    }
}

struct SudokuCell: View {
    
    let number: Int?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 30, height: 30)
                .border(.indigo)
            
            if number != nil {
                Text("\(number!)")
            }
        }
    }
}
