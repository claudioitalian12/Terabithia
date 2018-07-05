//
//  CollectionViewController.swift
//  Terabithia
//
//  Created by Claudio Cavalli on 04/03/18.
//  Copyright © 2018 Claudio Cavalli. All rights reserved.
//

import UIKit

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imgImage.image = imageArray[indexPath.row]
        
        
       
        collectionView.layoutMargins = UIEdgeInsets.zero
        collectionView.layer.borderWidth = 0
   
        cell.layoutMargins = UIEdgeInsets.zero
        cell.layer.borderWidth = 0
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0: do{Language.instance.selectedlanguage(language: "fr-FR"); createAlert(title: "Language", message: "your language is fr")};break;
        case 1: do{Language.instance.selectedlanguage(language: "en-US"); createAlert(title: "Language", message: "your language is en")};break;
        case 2: do{Language.instance.selectedlanguage(language: "it-IT"); createAlert(title: "Language", message: "your language is it")};break;
        case 3: do{Language.instance.selectedlanguage(language: "ger-Ger"); createAlert(title: "Language", message: "your language is ger")};break;
            
        default: break
            
        }
    }
    
    
}
