//
//  KeyPadView.swift
//  Sudoku
//
//  Created by Tugs Khaliunbat on 7/26/23.
//

import SwiftUI

struct KeyPadView: View {
    
    @EnvironmentObject var dm: Sudoku
    @State var noteMode: Bool = false
    var body: some View {
        VStack {
            HStack() {
                ForEach(1 ..< 10) { number in
                    KeyButtonView(number: number, noteMode: $noteMode).environmentObject(dm)
                }
            }
            HStack {
                Button() {
                    //                        print("delete")
                    dm.removeValue(row: dm.activeCell[0], col: dm.activeCell[1])
                } label: {
                    Image(systemName: "trash")
                }
                .buttonStyle(.bordered)
                .tint(.indigo.opacity(2))
                .cornerRadius(12)
                .disabled(!(dm.activeCell != [] && !dm.isCorrect(row: dm.activeCell[0], col: dm.activeCell[1]) && dm.valueAt(row: dm.activeCell[0], col: dm.activeCell[1]) != 0))
                
                Button() {
                    noteMode.toggle()
//                    print(noteMode)
                } label: {
                    Image(systemName: "pencil")
                        .padding(EdgeInsets(top: 2.5, leading: 1, bottom: 2.5, trailing: 1))
                }
                    .buttonStyle(.bordered)
                    .tint(.indigo.opacity(2))
                    .cornerRadius(12)
                    .disabled(!noteMode)
                    .onTapGesture {
                        noteMode = true
//                        print(noteMode)
                    }
            }
        }
        
    }
}

struct KeyButtonView: View {
    
    @EnvironmentObject var dm: Sudoku
    var number: Int
    @Binding var noteMode: Bool
    
    var body: some View {
        Button {
//            print("button pressed")
            if dm.activeCell != [] {
                if(noteMode) {
                    if(dm.cellNotes[dm.activeCell[0]][dm.activeCell[1]].contains(number)) {
                        dm.removeCellNote(row: dm.activeCell[0], col: dm.activeCell[1], value: number)
//                        print(dm.cellNotes[dm.activeCell[0]][dm.activeCell[1]])
                    }
                    else {
                        dm.enterCellNote(row: dm.activeCell[0], col: dm.activeCell[1], value: number)
//                        print(dm.cellNotes[dm.activeCell[0]][dm.activeCell[1]])
                    }
                }
                else {
                    dm.enterValue(row: dm.activeCell[0], col: dm.activeCell[1], value: number)
                    //                print("number entered")
                }
            }
        } label: {
            Text("\(number) ").bold()
                .padding(-2)
        }
            .buttonStyle(.bordered)
            .tint(noteMode == true ? .black.opacity(0.7) : .indigo)
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
