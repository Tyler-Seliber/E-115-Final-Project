//
//  CheckersBoxCollectionViewCell.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber. All rights reserved.
//

import UIKit

class CheckersBoxCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gridBoxImage: UIImageView!
    @IBOutlet weak var pieceImage: UIImageView!
    
    var box:CheckersBoardBox?
    
    func setBox(_ box:CheckersBoardBox) {
        
        self.box = box
        
        // Set box's background
        gridBoxImage.image = UIImage(named: box.getBackground())
        // pieceImage is only visible when the box has a piece
        pieceImage.isHidden = !box.getIsOccupied()
        
        // See if occupied box's piece is a king or not, set image accordingly
        if (box.getIsOccupied() && box.getIsKing()) {
            pieceImage.image = UIImage(named: "\(box.getPieceColor())PieceCrown")
        }
        else if (box.getIsOccupied()) {
            pieceImage.image = UIImage(named: "\(box.getPieceColor())Piece")

        }
        
        // Change appearance of piece when it is tapped
        if (box.getIsTapped()) {
            pieceImage.alpha = 0.8
        }
        else {
            pieceImage.alpha = 1
        }
        
    }
}
