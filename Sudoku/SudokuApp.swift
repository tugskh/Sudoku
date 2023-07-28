//
//  SudokuApp.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 6/2/23.
//

import SwiftUI

@main
struct SudokuApp: App {
    @StateObject var dm = Sudoku()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dm)
        }
    }
}
