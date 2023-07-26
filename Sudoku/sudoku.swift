//
//  sudoku.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/21/23.
//

import SwiftUI

struct sudoku: Codable, Identifiable {
    
    let id: Int
    let puzzle: String
    let solution: String
    
    static let example = sudoku(id: 1, puzzle: "800930002009000040702100960200000090060000070070006005027008406030000500500062008", solution: "846937152319625847752184963285713694463859271971246385127598436638471529594362718")
}
