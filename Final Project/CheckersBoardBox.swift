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
//    var rowNumber: Int
//    var columnNumber: Int
    
    init(color: String, index: Int, hasPiece: Bool, colorOfPiece: String) {
        boxColor = "\(color)Square"
        isOccupied = hasPiece
        pieceColor = colorOfPiece
        isKing = false
        position = index
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
    
//    // Box Background Color
//    let boxColor = ""
//    // If the box has a checkers piece
//    var isOccupied = false;
//    // Checkers piece color
//    var pieceColor = ""
//    // If checkers piece is king
//    var isKing = false
//    // Keep track of box's position
//    var position = 0
//    var rowNumber = 0
//    var columnNumber = 0
    
}

//extension CheckersBoardBox: NSItemProviderWriting {
//    func isEqual(_ object: Any?) -> Bool {
//        <#code#>
//    }
//
//    var hash: Int {
//        <#code#>
//    }
//
//    var superclass: AnyClass? {
//        <#code#>
//    }
//
//    func `self`() -> Self {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func isProxy() -> Bool {
//        <#code#>
//    }
//
//    func isKind(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func isMember(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func conforms(to aProtocol: Protocol) -> Bool {
//        <#code#>
//    }
//
//    func responds(to aSelector: Selector!) -> Bool {
//        <#code#>
//    }
//
//    var description: String {
//        <#code#>
//    }
//
//    static var writableTypeIdentifiersForItemProvider: [String] {
//        <#code#>
//    }
//
//    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
//        <#code#>
//    }
//
//
//
//
//}
