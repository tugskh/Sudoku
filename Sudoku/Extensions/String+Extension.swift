//
//  String+Extension.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/20/23.
//

import SwiftUI

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
