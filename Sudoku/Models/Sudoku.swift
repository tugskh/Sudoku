//
//  Sudoku.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/20/23.
//

import SwiftUI

class Sudoku: ObservableObject {
    
    
    @Environment(\.colorScheme) var colorScheme
    @Published var cells: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @Published var activeCell: [Int] = []
    @Published var cellNotes: [[[Int]]] = Array(repeating: Array(repeating: [], count: 9), count: 9)
    @Published var wrong_try = 0
    var gameOver: Bool = false
    var system_cells: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var mode: modes?
    var solution: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    var id = 0
    
    init() {
        startGame()
    }
    
    func startGame() {
        gameOver = false
        wrong_try = 0
        if activeCell != [] {
            activeCell = []
        }
        if mode != nil {
            populateDefaults()
        }
    }
    
    func populateDefaults() {
        
        var sudokus: [sudoku] = [sudoku]()
//        print("mode", self.mode!)
        let fileName: String = "\(self.mode!)"
//        print("filename", fileName)
        
        if let jsonURL = Bundle.main.url(forResource: fileName, withExtension: "json") {
            let jsonData = try! Data(contentsOf: jsonURL)
            let jsonDecoder = JSONDecoder()
            sudokus = try! jsonDecoder.decode([sudoku].self, from: jsonData)
        }
//            print(sudokus)
        
        if let sudoku = sudokus.randomElement() {
            id = sudoku.id
//            print(id)
            for row in 0...8 {
                for col in 0...8 {
                    system_cells[row][col] = Int(sudoku.puzzle[row*9+col])!
                    solution[row][col] = Int(sudoku.solution[row*9+col])!
                    //                    print(cells[row][col])
                }
            }
            cells = system_cells
        }

        
    }
    
    func isEmpty(row: Int, col: Int) -> Bool {
        return cells[row][col] == 0
    }
    
    func isCorrect(row: Int, col: Int) -> Bool {
        return cells[row][col] == solution[row][col]
    }
    
    func enterValue(row: Int, col: Int, value: Int) {
        if isEmpty(row: row, col: col) || !isCorrect(row: row, col: col) {
            cells[row][col] = value
        }
        if !isCorrect(row: row, col: col) {
            wrong_try += 1
        } else {
            
            for r in row-row%3...row-row%3+2 {
                for c in col-col%3...col-col%3+2 {
//                    print(r,c)
                    if(isEmpty(row: r, col: c)){
//                        print(r,c, cellNotes[r][c])
                        removeCellNote(row: r, col: c, value: value)
//                        print(r,c, cellNotes[r][c])
                    }
                }
            }
            
            for i in 0...8 {
                if cellNotes[i][col].contains(value) {
                    removeCellNote(row: i, col: col, value: value)
                }
                if cellNotes[row][i].contains(value) {
                    removeCellNote(row: row, col: i, value: value)
                }
            }
            
        }
        if wrong_try == 3 || cells == solution {
            withAnimation(.easeIn(duration: 14)) {
                gameOver = true
            }
        }
    }
    
    func removeValue(row: Int, col: Int) {
        cells[row][col] = 0
    }
    
    func valueAt(row: Int, col: Int) -> Int{
        return cells[row][col]
    }
    
    func setActiveCell(row: Int, col: Int) {
//        if isEmpty(row: row, col: col) || !isCorrect(row: row, col: col) {
            activeCell = [row, col]
//        }
    }
    
    func cellColor(row: Int, col: Int) -> Color {
        
        
        if(activeCell != []) {
            
            if(!isCorrect(row: row, col: col) && valueAt(row: row, col: col) != 0) {
                return Color.red.opacity(0.2)
            }
            if(isEmpty(row: activeCell[0], col: activeCell[1])) {
                if(activeCell[0] == row || activeCell[1] == col) {
                    return Color.indigo.opacity(0.2)
                }
                if(row >= activeCell[0]-activeCell[0]%3 && row < activeCell[0]-activeCell[0]%3+3 && col >= activeCell[1]-activeCell[1]%3 && col < activeCell[1]-activeCell[1]%3+3) {
                    return Color.indigo.opacity(0.2)
                }
            }
            if(!isEmpty(row: row, col: col) && valueAt(row: row, col: col) == valueAt(row: activeCell[0], col: activeCell[1])) {
                return Color.indigo.opacity(0.3)
            }
        }
        
//        if(!isCorrect(row: row, col: col) && valueAt(row: row, col: col) != 0) {
//            return Color.red.opacity(0.2)
//        }
        
        return .clear
    }
    
    func systemCell(row: Int, col: Int) -> Bool {
        if cells[row][col] == system_cells[row][col] {
            return true
        }
        return false
    }
    
    func countCorrectOccurences(number: Int) -> Int {
        var count = 0
        for row in 0...8 {
            for col in 0...8 {
                if cells[row][col] == number && isCorrect(row: row, col: col) {
                    count += 1
                }
            }
        }
        return count
    }
    
    func enterCellNote(row: Int, col: Int, value: Int) {
        if isEmpty(row: row, col: col) || !isCorrect(row: row, col: col) {
            if(!cellNotes[row][col].contains(value)) {
                cellNotes[row][col].append(value)
            }
        }
    }
    
    func removeCellNote(row: Int, col: Int, value: Int) {
        if cellNotes[row][col].contains(value) {
            cellNotes[row][col] = cellNotes[row][col].filter {$0 != value}
        }
    }
    
}

struct sudoku: Codable, Identifiable {
    
    let id: Int
    let puzzle: String
    let solution: String
    
    static let example = sudoku(id: 1, puzzle: "800930002009000040702100960200000090060000070070006005027008406030000500500062008", solution: "846937152319625847752184963285713694463859271971246385127598436638471529594362718")
}


