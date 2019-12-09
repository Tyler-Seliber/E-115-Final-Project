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
            
            print("row \(row)")
            if (row % 2 == 0) {
                for column in 0..<8 {
                    if (column % 2 == 0) {
                        generatedBoxesArray.append(addBox(backgroundColor: "Red", pieceColor: "Red"))
                    }
                    else {
                        generatedBoxesArray.append(addBox(backgroundColor: "Black", pieceColor: "Red"))
                    }
                    print("column \(column)")
                }
            }
            else {
                for column in 0..<8 {
                    if (column % 2 == 0) {
                        generatedBoxesArray.append(addBox(backgroundColor: "Black", pieceColor: "Red"))
                    }
                    else {
                        generatedBoxesArray.append(addBox(backgroundColor: "Red", pieceColor: "Red"))
                    }
                    print("column \(column)")
                }
            }
        }
        
        // Return the array
        return generatedBoxesArray
        
    }
    
    func addBox(backgroundColor: String, pieceColor: String) -> CheckersBoardBox {
        
        let box = CheckersBoardBox()
        
        box.boxColor = "\(backgroundColor)Square"
        box.isOccupied = (backgroundColor == pieceOnBoxColor)
        box.pieceColor = pieceColor
        box.isKing = false
        
        return box
        
    }
    
}
