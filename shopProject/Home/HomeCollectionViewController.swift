//
//  HomeCollectionViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = "ProductCell"
    private let sectionInserts = UIEdgeInsets (top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 3
    //Searches is an array that will keep track of all the searches made in the app
    var searches: [UIImage] = [];
    
    override func viewDidLoad() {
        searches.append(UIImage(named: "img_forest.jpg")!)
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.cellImageView.image = searches[0]
    
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
    }
}
