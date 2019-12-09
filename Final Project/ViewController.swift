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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
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
        
        print("tapped \(indexPath)")
        
    }
    
    // Animate the cells(?)
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            cell.transform = .identity
        }, completion: nil)
        
    }
    
}

extension ViewController: CheckersBoardCollectionViewDelegate {
    
    func theNumberOfItemsInCollectionView() -> Int {
        return boxArray.count
    }
    
}
