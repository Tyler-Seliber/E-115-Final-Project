//
//  ViewController.swift
//  Final Project
//
//  Created by Tyler Seliber on 12/7/19.
//  Copyright © 2019 Tyler Seliber. All rights reserved.
//

import UIKit

let reuseIdentifier = "CheckersBoardGridCell"

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    var model = GridBoxModel()
    var boxArray = [CheckersBoardBox]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layout = collectionView.collectionViewLayout as? CheckersBoardViewLayout
        layout?.delegate = self
        
        boxArray = model.getGridBoxes()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func movePiece(moveFrom: Int, moveTo: Int) {
        
        let boxFrom = boxArray[moveFrom]
        let boxTo = boxArray[moveTo]
        let tempBox = boxFrom.copy() as! CheckersBoardBox
        
        // Swap isOccupied, pieceColor, and isKing
        boxFrom.changeIsOccupied(occupied: boxTo.getIsOccupied())
        boxFrom.changePieceColor(piece: boxTo.getPieceColor())
        boxFrom.changeIsKing(king: boxTo.getIsKing())
        
        boxTo.changeIsOccupied(occupied: tempBox.getIsOccupied())
        boxTo.changePieceColor(piece: tempBox.getPieceColor())
        boxTo.changeIsKing(king: tempBox.getIsKing())
        
        // Update the array
        boxArray[moveFrom] = boxFrom
        boxArray[moveTo] = boxTo
        
        // Reload the collection view
        self.collectionView.reloadData()
        
    }
    
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxArray.count
    }
    
    // Sets up the CollectionView cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CheckersBoxCollectionViewCell
        
        let box = boxArray[indexPath.row]
        
        cell.setBox(box)
        
        return cell
    }
    
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    // Runs whenever a CollectionViewCell is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let box = boxArray[indexPath.row]
        print("tapped \(box.getPosition()) \t isOccupied = \(box.getIsOccupied())")
        
        movePiece(moveFrom: box.getPosition(), moveTo: 27)
        
    }
    
    // Animate the cells
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {cell.transform = .identity}, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = boxArray.remove(at: sourceIndexPath.item)
        boxArray.insert(temp, at: destinationIndexPath.item)
    }
    
}

extension ViewController: CheckersBoardCollectionViewDelegate {
    
    func theNumberOfItemsInCollectionView() -> Int {
        return boxArray.count
    }
    
}
