//
//  ViewController.swift
//  PinterestClone
//
//  Created by David D on 12/19/18.
//  Copyright © 2018 David D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    let images = [#imageLiteral(resourceName: "image-1"), #imageLiteral(resourceName: "image-2"), #imageLiteral(resourceName: "image-3"), #imageLiteral(resourceName: "image-4"), #imageLiteral(resourceName: "image-5"), #imageLiteral(resourceName: "image-6"), #imageLiteral(resourceName: "image-7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

// MARK: - Flow layout delegate

// protocol defines methods that lets you implement - implementations needed to create class
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCols: CGFloat = 2
        let width = collectionView.frame.size.width
        let xInsets: CGFloat = 10
        let cellSpacing: CGFloat = 5
        
        return CGSize(width: (width / numberOfCols) - (xInsets + cellSpacing), height: (width / numberOfCols) - (xInsets + cellSpacing))
    }
}


// MARK: Data Source

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let image = images[indexPath.item]
        cell.imageView.image = image
        
        return cell
    }
}
