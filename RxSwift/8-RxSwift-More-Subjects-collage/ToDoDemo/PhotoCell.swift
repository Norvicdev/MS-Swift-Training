//
//  PhotoCell.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 9/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit
import RxSwift

class PhotoCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var checkmark: UIImageView!
    
    var representedAssetIdentifier: String!
    var isCheckmarked: Bool = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    func flipCheckmark() {
        self.isCheckmarked = !self.isCheckmarked
    }
    
    func selected() {
        self.flipCheckmark()
        setNeedsDisplay()
        
        UIView.animate(withDuration: 0.1,
            animations: { [weak self] in
                
            if let isCheckmarked = self?.isCheckmarked {
                self?.checkmark.alpha = isCheckmarked ? 1 : 0
            }
        })
    }
}
