//
//  CheckersBoardBox.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber and Jordan Sun. All rights reserved.
//
//  I pledge my honor that I have abided by the Stevens Honor System.
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
    private var column: Int
    private var row: Int
    // Keep track if button should be clicked
    private var isEnabled: Bool
    // Keep track if button is tapped to change its image attributes
    private var isTapped: Bool
//    var rowNumber: Int
//    var columnNumber: Int
    
    
    init(color: String, index: Int, hasPiece: Bool, colorOfPiece: String, king: Bool) {
        boxColor = "\(color)Square"
        isOccupied = hasPiece
        pieceColor = colorOfPiece
        isKing = king
        position = index
        column = position % 8
        row = (position - column) / 8
        isEnabled = false
        isTapped = false
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = CheckersBoardBox(color: boxColor, index: position, hasPiece: isOccupied, colorOfPiece: pieceColor, king: isKing)
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
        // Update column and row
        column = position % 8
        row = (position - column) / 8
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
    
    func getColumn() -> Int {
        return column
    }
    
    func getRow() -> Int {
        return row
    }
    
    func getIsEnabled() -> Bool {
        return isEnabled
    }
    
    func getIsTapped() -> Bool {
        return isTapped
    }
}
