//
//  Sudoku.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/20/23.
//

import SwiftUI

class Sudoku: ObservableObject {
    
    @Published var cells: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var activeCell: [Int] = []
    var mode: modes?
    var solutions: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var id = 0
    
    
    func startGame() {
        if activeCell != [] {
            activeCell = []
        }
        if mode != nil {
            populateDefaults()
        }
    }
    
    func populateDefaults() {
        
        var sudokus: [sudoku] = [sudoku]()
        print("mode", self.mode!)
        let fileName: String = "\(self.mode!)"
        print("filename", fileName)
        
        if let jsonURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            let jsonData = try! Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder()
            sudokus = try! jsonDecoder.decode([sudoku].self, from: jsonData)
        }
//            print(sudokus)
        
        if let sudoku = sudokus.randomElement() {
            id = sudoku.id
            print(id)
            for row in 0...8 {
                for col in 0...8 {
                    cells[row][col] = Int(sudoku.puzzle[row*9+col])!
                    solutions[row][col] = Int(sudoku.solution[row*9+col])!
                    //                    print(cells[row][col])
                }
            }
        }

        
    }
    
    func isEmpty(row: Int, col: Int) -> Bool {
        return cells[row][col] == 0
    }
    
    func isCorrect(row: Int, col: Int) -> Bool {
        return cells[row][col] == solutions[row][col]
    }
    
    func enterValue(row: Int, col: Int, value: Int) {
        if isEmpty(row: row, col: col) || !isCorrect(row: row, col: col) {
            cells[row][col] = value
        }
    }
    
    func removeValue(row: Int, col: Int) {
        cells[row][col] = 0
    }
    
    func valueAt(row: Int, col: Int) -> Int{
        return cells[row][col]
    }
    
    func setActiveCell(row: Int, col: Int) {
        if isEmpty(row: row, col: col) && !isCorrect(row: row, col: col) {
            activeCell = [row, col]
        }
    }
    
    func cellColor(row: Int, col: Int) -> Color{
        if(!isCorrect(row: row, col: col) && valueAt(row: row, col: col) != 0) {
            return Color.red.opacity(0.5)
        } else {
            return Color.clear
        }
    }
    
}

struct sudoku: Codable, Identifiable {
    
    let id: Int
    let puzzle: String
    let solution: String
    
    static let example = sudoku(id: 1, puzzle: "800930002009000040702100960200000090060000070070006005027008406030000500500062008", solution: "846937152319625847752184963285713694463859271971246385127598436638471529594362718")
}


