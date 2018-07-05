//
//  CollectionViewController.swift
//  terabithia
//
//  Created by Claudio Cavalli on 04/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

extension MenuSelectStoryMode: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgImage.image = imageArray[indexPath.row]
        cell.button.setTitle("Red Little", for: UIControlState.normal) 
        
        
        collectionView.layoutMargins = UIEdgeInsets.zero
        collectionView.layer.borderWidth = 0
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.layer.borderWidth = 0
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MusicManager.shared.stop()
        performSegue(withIdentifier: "Segui", sender: self)
       
    }
    
}


