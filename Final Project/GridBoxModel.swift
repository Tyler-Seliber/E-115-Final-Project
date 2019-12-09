//
//  ItemModel.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber. All rights reserved.
//

import Foundation

class GridBoxModel {
    
    func getGridBoxes() -> [CheckersBoardBox] {
        
        // Declare an array to store the generated boxes
        var generatedBoxesArray = [CheckersBoardBox]()
        
        
        // Create the grid of CheckersBoardBox
        
        for _ in (1...4) {
            
            for _ in 1...4 {
                generatedBoxesArray.append(addBox(backgroundColor: "RedSquare", isOccupied: false))
                generatedBoxesArray.append(addBox(backgroundColor: "BlackSquare", isOccupied: false))
            }
            
            for _ in 1...4 {
                generatedBoxesArray.append(addBox(backgroundColor: "BlackSquare", isOccupied: false))
                generatedBoxesArray.append(addBox(backgroundColor: "RedSquare", isOccupied: false))
            }
        }
        
        // Return the array
        return generatedBoxesArray
        
    }
    
    func addBox(backgroundColor: String, isOccupied: Bool) -> CheckersBoardBox {
        
        let box = CheckersBoardBox()
        
        box.backgroundColor = backgroundColor
        box.isOccupied = false
        box.pieceColor = ""
        box.isKing = false
        
        return box
        
    }
    
}
