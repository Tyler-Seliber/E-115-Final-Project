//
//  CheckersBoardBox.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber. All rights reserved.
//

import Foundation

class CheckersBoardBox: NSCopying {
    
    // Box Background Color
    private var boxColor: String
    // If the box has a checkers piece
    private var isOccupied: Bool
    // Checkers piece color
    private var pieceColor: String
    // If checkers piece is king
    private var isKing: Bool
    // Keep track of box's position
    private var position: Int
    // Keep track if button should be clicked
    private var isEnabled: Bool
    // Keep track if button is tapped to change its image attributes
    private var isTapped: Bool
//    var rowNumber: Int
//    var columnNumber: Int
    
    init(color: String, index: Int, hasPiece: Bool, colorOfPiece: String) {
        boxColor = "\(color)Square"
        isOccupied = hasPiece
        pieceColor = colorOfPiece
        isKing = false
        position = index
        isEnabled = false
        isTapped = false
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = CheckersBoardBox(color: boxColor, index: position, hasPiece: isOccupied, colorOfPiece: pieceColor)
        return copy
        
    }
    
    // MARK: Modifier Functions
    func changeBackground(color: String) {
        boxColor = color
    }
    
    func changeIsOccupied(occupied: Bool) {
        isOccupied = occupied
    }
    
    func changePieceColor(piece: String) {
        pieceColor = piece
    }
    
    func changeIsKing(king: Bool) {
        isKing = king
    }
    
    func changePosition(pos: Int) {
        position = pos
    }
    
    func changeIsEnabled(enabled: Bool) {
        isEnabled = enabled
    }
    
    func changeisTapped(tapped: Bool) {
        isTapped = tapped
    }
    
    // MARK: Accessor Functions
    func getBackground() -> String {
        return boxColor
    }
    
    func getIsOccupied() -> Bool {
        return isOccupied
    }
    
    func getPieceColor() -> String {
        return pieceColor
    }
    
    func getIsKing() -> Bool {
        return isKing
    }
    
    func getPosition() -> Int {
        return position
    }
    
    func getIsEnabled() -> Bool {
        return isEnabled
    }
    
    func getIsTapped() -> Bool {
        return isTapped
    }
}
