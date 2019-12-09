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
        
        gridBoxImage.image = UIImage(named: box.boxColor)
        pieceImage.isHidden = !box.isOccupied
        if (box.isOccupied && box.isKing) {
            pieceImage.image = UIImage(named: "\(box.pieceColor)PieceCrown")
        }
        else if (box.isOccupied) {
            pieceImage.image = UIImage(named: "\(box.pieceColor)Piece")

        }
        
    }
}
