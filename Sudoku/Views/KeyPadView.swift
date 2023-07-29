//
//  KeyPadView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/26/23.
//

import SwiftUI

struct KeyPadView: View {
    
    @EnvironmentObject var dm: Sudoku
    var body: some View {
        HStack() {
            ForEach(1 ..< 10) { number in
                KeyButtonView(number: number).environmentObject(dm)
            }
        }
        
    }
}

struct KeyButtonView: View {
    
    @EnvironmentObject var dm: Sudoku
    var number: Int
    
    var body: some View {
        Button {
//            print("button pressed")
            if dm.activeCell != [] {
                dm.enterValue(row: dm.activeCell[0], col: dm.activeCell[1], value: number)
//                print("number entered")
            }
        } label: {
            Text("\(number) ").bold()
                .padding(-2)
        }
            .buttonStyle(.bordered)
            .tint(.indigo)
            .cornerRadius(12)
            .frame(maxWidth: 35, maxHeight: 35)
            .disabled(dm.countCorrectOccurences(number: number) == 9)

    }
}

struct KeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView().environmentObject(Sudoku())
    }
}
