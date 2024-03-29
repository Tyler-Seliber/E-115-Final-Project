//
//  ViewController.swift
//  Final Project
//
//  Created by Tyler Seliber and Weiliang Jordan Sun on 12/7/19.
//  Copyright © 2019 Tyler Seliber and Weiliang Jordan Sun. All rights reserved.
//
//  I pledge my honor that I have abided by the Stevens Honor System.
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
    var swapArray:[Int] = []
    var player = 1
    
    
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
        
        // Check and set piece as king piece
        if (!boxFrom.getIsKing()) {
            boxFrom.changeIsKing(king: (boxFrom.getPieceColor() == "Black" && moveTo >= 56) || (boxFrom.getPieceColor() == "Red" && moveTo <= 7))
        }
        
        let tempBox = boxFrom.copy() as! CheckersBoardBox
        
        // Swap isOccupied, pieceColor, and isKing
        boxFrom.changeIsOccupied(occupied: boxTo.getIsOccupied())
        boxFrom.changePieceColor(piece: boxTo.getPieceColor())
        boxFrom.changeIsKing(king: boxTo.getIsKing())
        
        boxTo.changeIsOccupied(occupied: tempBox.getIsOccupied())
        boxTo.changePieceColor(piece: tempBox.getPieceColor())
        boxTo.changeIsKing(king: tempBox.getIsKing())
        
        // Reset pieceImage attributes
        boxFrom.changeisTapped(tapped: false)
        boxTo.changeisTapped(tapped: false)
        
        //Check and change player turn if the piece moved
        if (moveFrom != moveTo) {
            if (player < 0) { // Was Black's turn, will be Red player's turn
                for box in boxArray {
                    if (box.getIsOccupied() && box.getPieceColor() == "Black") {
                        box.changeIsEnabled(enabled: false)
                    }
                    if (box.getIsOccupied() && box.getPieceColor() == "Red") {
                        box.changeIsEnabled(enabled: true)
                    }
                }
            }
            else if (player > 0) { // Was Red's turn, will be Black player's turn
                for box in boxArray {
                    if (box.getIsOccupied() && box.getPieceColor() == "Red") {
                        box.changeIsEnabled(enabled: false)
                    }
                    if (box.getIsOccupied() && box.getPieceColor() == "Black") {
                        box.changeIsEnabled(enabled: true)
                    }
                }
            }
            
            player *= -1
        }
        
        // Update the array
        boxArray[moveFrom] = boxFrom
        boxArray[moveTo] = boxTo
        
        // Reload the collection view
        self.collectionView.reloadData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
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
        print("tapped \(box.getPosition()) \t column: \(box.getColumn()) \t row \(box.getRow())  \t isOccupied = \(box.getIsOccupied())")
        
        
        var isFirstTapped: Bool
        var canMovePiece: Bool?
        
        // Determine if the box is the first box tapped and has a piece
        isFirstTapped = box.getIsOccupied() && swapArray.count == 0 && box.getIsEnabled()
        
        // Determine if the second box tapped can be used to move a piece to
        if (swapArray.count == 1) {
            let boxToIsEmpty = !box.getIsOccupied() ^ (box.getPosition() == swapArray[0])
            let boxToSameColor = box.getBackground() == boxArray[swapArray[0]].getBackground()
            let toValidColumn = (abs(boxArray[swapArray[0]].getColumn() - box.getColumn()) <= 2 && abs(boxArray[swapArray[0]].getColumn() - box.getColumn()) > 0)
            let canMoveAsKing = (boxArray[swapArray[0]].getIsKing() && box.getRow() != boxArray[swapArray[0]].getRow()) && toValidColumn
            let canMoveIfBlack = boxArray[swapArray[0]].getPieceColor() == "Black" && box.getRow() <= boxArray[swapArray[0]].getRow() + 2 && box.getRow() > boxArray[swapArray[0]].getRow() && toValidColumn
            let canMoveIfRed = boxArray[swapArray[0]].getPieceColor() == "Red" && box.getRow() >= boxArray[swapArray[0]].getRow() - 2 && box.getRow() < boxArray[swapArray[0]].getRow() && toValidColumn
            let toValidPosition = (canMoveAsKing || canMoveIfBlack || canMoveIfRed) ^ (box.getPosition() == swapArray[0])
            
            canMovePiece = boxToIsEmpty && boxToSameColor && toValidPosition
        }
        
        
        // Add the box position to the array if the box contains a piece
        if (isFirstTapped){
            swapArray.append(indexPath.row)
            boxArray[indexPath.row].changeisTapped(tapped: true)
            collectionView.reloadData()
        }
            /*
             Swap if:
             A piece has already been selected to move
             The second box tapped is not occupied, unless it is the same box the selected piece is currently in (acts as a "deselect piece")
             The second box tapped has the same background color as the box the piece started in (Keeps pieces on same color for whole game)
             The second box tapped is a valid position for the piece to move to
             */
            
        else if (canMovePiece ?? false) {
            
            swapArray.append(indexPath.row)
            movePiece(moveFrom: swapArray.first!, moveTo: swapArray.last!)
            swapArray.removeAll(keepingCapacity: true)
        }
        
    }
    
    //    // Animate the cells
    //    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    //
    //        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    //
    //        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {cell.transform = .identity}, completion: nil)
    //    }
    
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

// Implement exclusive or
extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
