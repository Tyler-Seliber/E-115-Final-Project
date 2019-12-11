//
//  ItemModel.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber. All rights reserved.
//

import Foundation

class GridBoxModel {
    
    // String to keep track of what color boxes the pieces will be on
    var pieceOnBoxColor = ""
    
    func getGridBoxes() -> [CheckersBoardBox] {
        
        // Play game on random piece color
        let random = Int.random(in: 0...1)
        switch random {
        case 0:
            pieceOnBoxColor = "Black"
            break
        case 1:
            pieceOnBoxColor = "Red"
            break
        default:
            break
        }
        
        // Declare an array to store the generated boxes
        var generatedBoxesArray = [CheckersBoardBox]()
        
        // Create the grid of CheckersBoardBox
        for row in (0..<8) {
            
            //            print("row \(row)")
            if (row % 2 == 0) {
                for column in 0..<8 {
                    let position = 8 * row + column
                    if (column % 2 == 0) {
                        generatedBoxesArray.append(addBox(backgroundColor: "Red", position: position, row: row, column: column))
                    }
                    else {
                        generatedBoxesArray.append(addBox(backgroundColor: "Black", position: position, row: row, column: column))
                    }
                    // print("column \(column)")
                }
            }
            else {
                for column in 0..<8 {
                    let position = 8 * row + column
                    if (column % 2 == 0) {
                        generatedBoxesArray.append(addBox(backgroundColor: "Black", position: position, row: row, column: column))
                    }
                    else {
                        generatedBoxesArray.append(addBox(backgroundColor: "Red", position: position, row: row, column: column))
                    }
                    // print("column \(column)")
                }
            }
        }
        
        // Return the array
        return generatedBoxesArray
        
    }
    
    func addBox(backgroundColor: String, position: Int, row: Int, column: Int) -> CheckersBoardBox {
        
        var isOccupied = (backgroundColor == pieceOnBoxColor)
        //            box.boxColor = "\(backgroundColor)Square"
        //            box.isOccupied = (backgroundColor == pieceOnBoxColor)
        var pieceColor = ""
        if (isOccupied) {
            if (row >= 0 && row <= 2) {
                pieceColor = "Black"
            }
            else if (row >= 5 && row <= 7) {
                pieceColor = "Red"
            }
            else {
                isOccupied = !isOccupied
            }
        }
        
        let box = CheckersBoardBox(color: backgroundColor, index: position, hasPiece: isOccupied, colorOfPiece: pieceColor)
        
        //            box.rowNumber = row
        //            box.columnNumber = column
        
        return box
    }
    
}
