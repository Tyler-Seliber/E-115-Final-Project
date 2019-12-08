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
    
    var box:CheckersBoardBox?
    
    func setBox(_ box:CheckersBoardBox) {
        
        self.box = box
        
        gridBoxImage.image = UIImage(named: box.backgroundColor)
    }
}
