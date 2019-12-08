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
        
        //Declare an array to store the generated cards
        var generatedBoxesArray = [CheckersBoardBox]()
        
        generatedBoxesArray.append(addBox(isOccupied: false))
        
       
        //Return the array
        return generatedBoxesArray
        
    }
    
    func addBox(isOccupied: Bool) -> CheckersBoardBox {
        
        let box = CheckersBoardBox()
        
        box.hasPiece = false
        
        return box
        
    }
    
}
