//
//  HomeViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "ProductCell"
    private let itemsPerRow: CGFloat = 3
    //Searches is an array that will keep track of all the searches made in the app
    var productImages: [UIImage] = [
        UIImage(named: "ipad")!,
        UIImage(named: "iphone")!,
        UIImage(named: "tv")!,
        UIImage(named: "macbook")!,
        UIImage(named: "alexa")!,
        UIImage(named: "googleHome")!,
        UIImage(named: "chromecast")!,
        UIImage(named: "fireTv")!,
    ];
    
    var productText: [String?] = []
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width-20)/2, height: (self.collectionView.frame.size.height)/3)
        
        productText = ["iPad", "iPhone", "TV", "MacBook", "Alexa", "Google Home", "Chromecast", "Fire TV" ]
        
        //Disable Back Button (temporally)
        navigationItem.hidesBackButton = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.cellImageView.image = productImages[indexPath.item]
        cell.cellTextLabel.text = productText[indexPath.item]
        
        //Tint border Cell
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.6
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.6
    }
}
