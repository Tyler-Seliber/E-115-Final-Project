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
//            collectionView.dragDelegate = self
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
//        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true
        collectionView.reorderingCadence = .immediate
        
    }
    
    func movePiece(moveFrom: Int, moveTo: Int) {
        
        
        // TODO: Change positions
        let tempBox = boxArray[moveFrom]
        print("\(tempBox.rowNumber) \(tempBox.columnNumber)")
        boxArray[moveFrom] = boxArray[moveTo]
        boxArray[moveFrom].boxColor = tempBox.boxColor
        print("\(boxArray[moveFrom].rowNumber) \(boxArray[moveFrom].columnNumber)")
        boxArray[moveTo] = tempBox
        
        self.collectionView.reloadData()
        
    }
    
//    //MARK: Private Methods
//
//    /// This method moves a cell from source indexPath to destination indexPath within the same collection view. It works for only 1 item. If multiple items selected, no reordering happens.
//    ///
//    /// - Parameters:
//    ///   - coordinator: coordinator obtained from performDropWith: UICollectionViewDropDelegate method
//    ///   - destinationIndexPath: indexpath of the collection view where the user drops the element
//    ///   - collectionView: collectionView in which reordering needs to be done.
//    private func reorderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView)
//    {
//        let items = coordinator.items
//        if items.count == 1, let item = items.first, let sourceIndexPath = item.sourceIndexPath
//        {
//            var dIndexPath = destinationIndexPath
//            if dIndexPath.row >= collectionView.numberOfItems(inSection: 0)
//            {
//                dIndexPath.row = collectionView.numberOfItems(inSection: 0) - 1
//            }
//            collectionView.performBatchUpdates({
//                if collectionView === self.collectionView2
//                {
//                    self.items2.remove(at: sourceIndexPath.row)
//                    self.items2.insert(item.dragItem.localObject as! String, at: dIndexPath.row)
//                }
//                else
//                {
//                    self.items1.remove(at: sourceIndexPath.row)
//                    self.items1.insert(item.dragItem.localObject as! String, at: dIndexPath.row)
//                }
//                collectionView.deleteItems(at: [sourceIndexPath])
//                collectionView.insertItems(at: [dIndexPath])
//            })
//            coordinator.drop(items.first!.dragItem, toItemAt: dIndexPath)
//        }
//    }
//
//    /// This method copies a cell from source indexPath in 1st collection view to destination indexPath in 2nd collection view. It works for multiple items.
//    ///
//    /// - Parameters:
//    ///   - coordinator: coordinator obtained from performDropWith: UICollectionViewDropDelegate method
//    ///   - destinationIndexPath: indexpath of the collection view where the user drops the element
//    ///   - collectionView: collectionView in which reordering needs to be done.
//    private func copyItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView)
//    {
//        collectionView.performBatchUpdates({
//            var indexPaths = [IndexPath]()
//            for (index, item) in coordinator.items.enumerated()
//            {
//                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
//                if collectionView === self.collectionView2
//                {
//                    self.items2.insert(item.dragItem.localObject as! String, at: indexPath.row)
//                }
//                else
//                {
//                    self.items1.insert(item.dragItem.localObject as! String, at: indexPath.row)
//                }
//                indexPaths.append(indexPath)
//            }
//            collectionView.insertItems(at: indexPaths)
//        })
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
        let box = boxArray[indexPath.row]
        print("tapped \(box.position) (\(box.rowNumber),\(box.columnNumber))\t isOccupied = \(box.isOccupied)")
        
        movePiece(moveFrom: box.position, moveTo: 27)
        
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

// MARK: UICollectionViewDragDelegate
//extension ViewController: UICollectionViewDragDelegate {
//    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//
//        //        let item = collectionView == collectionView ? self.boxArray[indexPath.row] : self.boxArray[indexPath.row]
////        let item = self.boxArray[indexPath.row]
////        let itemProvider = NSItemProvider(object: item)
////        let dragItem = UIDragItem(itemProvider: itemProvider)
////        dragItem.localObject = item
//        return [dragItem]
//
//    }
//    // Used to drag multiple items
//    //    func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
//    //
//    //        let item = collectionView == collectionView1 ? self.items1[indexPath.row] : self.items2[indexPath.row]
//    //        let itemProvider = NSItemProvider(object: item as NSString)
//    //        let dragItem = UIDragItem(itemProvider: itemProvider)
//    //        dragItem.localObject = item
//    //        return [dragItem]
//    //
//    //    }
//
////    func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters? {
////
////        if collectionView == collectionView1
////        {
////            let previewParameters = UIDragPreviewParameters()
////            previewParameters.visiblePath = UIBezierPath(rect: CGRect(x: 25, y: 25, width: 120, height: 120))
////            return previewParameters
////        }
////        return nil
////
////    }
//
//}

// MARK: UICollectionViewDropDelegate
extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        
        return session.canLoadObjects(ofClass: NSString.self)
        
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
//
//        if collectionView === self.collectionView1
//        {
//            if collectionView.hasActiveDrag
//            {
//                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
//            }
//            else
//            {
//                return UICollectionViewDropProposal(operation: .forbidden)
//            }
//        }
//        else
//        {
//            if collectionView.hasActiveDrag
//            {
//                return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
//            }
//            else
//            {
//                return UICollectionViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
//            }
//        }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
//        let destinationIndexPath: IndexPath
//        if let indexPath = coordinator.destinationIndexPath
//        {
//            destinationIndexPath = indexPath
//        }
//        else
//        {
//            // Get last index path of table view.
//            let section = collectionView.numberOfSections - 1
//            let row = collectionView.numberOfItems(inSection: section)
//            destinationIndexPath = IndexPath(row: row, section: section)
//        }
//
//        switch coordinator.proposal.operation
//        {
//        case .move:
//            self.reorderItems(coordinator: coordinator, destinationIndexPath:destinationIndexPath, collectionView: collectionView)
//            break
//
//        case .copy:
//            self.copyItems(coordinator: coordinator, destinationIndexPath: destinationIndexPath, collectionView: collectionView)
//
//        default:
//            return
//        }
        
    }
    
    
    
}

extension ViewController: CheckersBoardCollectionViewDelegate {
    
    func theNumberOfItemsInCollectionView() -> Int {
        return boxArray.count
    }
    
}
