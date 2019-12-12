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
        
        gridBoxImage.image = UIImage(named: box.getBackground())
        pieceImage.isHidden = !box.getIsOccupied()
        if (box.getIsOccupied() && box.getIsKing()) {
            pieceImage.image = UIImage(named: "\(box.getPieceColor())PieceCrown")
        }
        else if (box.getIsOccupied()) {
            pieceImage.image = UIImage(named: "\(box.getPieceColor())Piece")

        }
        
        if (box.getIsTapped()) {
            pieceImage.alpha = 0.8
        }
        else {
            pieceImage.alpha = 1
        }
        
    }
}
