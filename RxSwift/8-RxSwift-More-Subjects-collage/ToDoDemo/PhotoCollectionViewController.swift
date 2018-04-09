//
//  PhotoCollectionViewController.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 9/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import UIKit
import Photos
import RxSwift

class PhotoCollectionViewController: UICollectionViewController {

    fileprivate let selectedPhotosSubject = PublishSubject<UIImage>()
    var selectedPhotos: Observable<UIImage> {
        return selectedPhotosSubject.asObservable()
    }
    let bag = DisposeBag()

    fileprivate lazy var photos = PhotoCollectionViewController.loadPhotos()
    fileprivate lazy var imageManager = PHCachingImageManager()
    
    fileprivate lazy var thumbnailsize: CGSize = {
        let cellSize = (self.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        
        return CGSize(width: cellSize.width * UIScreen.main.scale,
                      height: cellSize.height * UIScreen.main.scale)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellSpace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        selectedPhotosSubject.onCompleted()
    }
}

// Photo library
extension PhotoCollectionViewController {
    
    static func loadPhotos() -> PHFetchResult<PHAsset> {
        let options = PHFetchOptions()
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        return PHAsset.fetchAssets(with: options)
    }
}

// Collection view related
extension PhotoCollectionViewController {
    func setCellSpace() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: (width-40) / 4, height: (width-40) / 4)
        collectionView!.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let asset = photos.object(at: indexPath.item)
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "PhotoMemo", for: indexPath) as! PhotoCell
        
        cell.representedAssetIdentifier = asset.localIdentifier
        
        imageManager.requestImage(for: asset,
                                  targetSize: thumbnailsize,
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler:
            { (image, _) in
            
                guard let image = image else { return }
            
                if cell.representedAssetIdentifier == asset.localIdentifier {
                    cell.imageView.image = image
                }
            }
        )
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        let asset = photos.object(at: indexPath.item)
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell {
            cell.selected()
        }
        
        imageManager.requestImage(for: asset,
            targetSize: view.frame.size,
            contentMode: .aspectFill,
            options: nil,
            resultHandler: { [weak self] (image, info) in
                guard let image = image, let info = info else { return }

                if let isThumbnail = info[PHImageResultIsDegradedKey] as? Bool,
                    !isThumbnail {

                    // TODO: Trigger photo selection event here
                    self?.selectedPhotosSubject.onNext(image)
                }
            })
    }

}
