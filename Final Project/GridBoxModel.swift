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
        
        // Declare an array to store the generated cards
        var generatedBoxesArray = [CheckersBoardBox]()
        
        for _ in 1...32 {
            generatedBoxesArray.append(addBox(backgroundColor: "RedSquare.png", isOccupied: false))
            generatedBoxesArray.append(addBox(backgroundColor: "BlackSquare.png", isOccupied: false))
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
