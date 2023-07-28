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
//        KeyButtonView(number: 1).environmentObject(dm)
        HStack() {
            ForEach(1 ..< 10) { number in
                KeyButtonView(number: number).environmentObject(dm)
            }
        }
//            .frame(maxWidth: .infinity)
            .padding()
        
    }
}

struct KeyButtonView: View {
    
    @EnvironmentObject var dm: Sudoku
    var number: Int
    
    var body: some View {
        Button {
            print("button pressed")
            if dm.activeCell != [] {
                dm.enterValue(row: dm.activeCell[0], col: dm.activeCell[1], value: number)
                print("number entered")
            }
        } label: {
            Text("\(number)").bold()
        }
            .buttonStyle(.bordered)
            .tint(.indigo)
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)



    }
}

struct KeyPadView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadView().environmentObject(Sudoku())
    }
}
