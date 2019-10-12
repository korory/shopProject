//
//  HomeViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let reuseIdentifier = "ProductCell"
    private let itemsPerRow: CGFloat = 3
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //Searches is an array that will keep track of all the searches made in the app
    var products: [Product] = []
    
    var currentProducts = [Product]() //Update table using the search bar
    
    
    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpSearchBar()
        
        setUpProducts()
        
        setUpLayout()

        //Disable Back Button (temporally)
        navigationItem.hidesBackButton = true
    }
    
    func setUpProducts(){
        
        products.append(Product(name: "iPad", image: "ipad"))
        products.append(Product(name: "iPhone", image: "iphone"))
        products.append(Product(name: "TV", image: "tv"))
        products.append(Product(name: "MacBook", image: "macbook"))
        products.append(Product(name: "Alexa", image: "alexa"))
        products.append(Product(name: "Google Home", image: "googleHome"))
        products.append(Product(name: "Chromecast", image: "chromecast"))
        products.append(Product(name: "Fire TV", image: "fireTv"))
        
        currentProducts = products
    }
    
    func setUpLayout(){
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width-20)/2, height: (self.collectionView.frame.size.height)/3)
    }
    
    func setUpSearchBar(){
        
        searchBar.delegate = self
        searchBar.autocapitalizationType = UITextAutocapitalizationType .none
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.cellImageView.image = UIImage(named:currentProducts[indexPath.item].image)
        cell.cellTextLabel.text = currentProducts[indexPath.item].name
        
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
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchActive = true;
        print("toca")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentProducts = products;
            collectionView.reloadData()
            return
            
        }
        currentProducts = products.filter({ (searchProduct) -> Bool in
            searchProduct.name.contains(searchText)
        })
        collectionView.reloadData()
    }
}

class Product{
    let name: String
    let image: String
    init(name :String, image :String) {
        self.name = name
        self.image = image
    }
}
