//
//  CellACollectionViewCell.swift
//  CollectionViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 13..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class CellACollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    //MARK: - Variable
    
    @IBOutlet weak var itemGroupTitleLabel: UILabel!
    
    var itemGroupData = ItemGroup()
    var itemGroupIndex = Int()
    
    var mainViewController = Main()
    
    //Variable End
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroupData.ItemSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 30) / 2, height: 199)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ItemCellACollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCellA", for: indexPath) as! ItemCellACollectionViewCell
        
    
        
        let itemImageName = itemGroupData.ItemSet[indexPath.row].ItemImageName
        ItemCellACollectionViewCell.itemImageView.image = UIImage(named: itemImageName)
        
        ItemCellACollectionViewCell.itemImageView.layer.cornerRadius = 10
        ItemCellACollectionViewCell.itemImageView.layer.masksToBounds = true
        
        ItemCellACollectionViewCell.itemTitleLabel.text = itemGroupData.ItemSet[indexPath.row].ItemTitleLabel
        
        return ItemCellACollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        NSDefault.set(itemGroupIndex, forKey: "ItemGroupIndex")
        NSDefault.set(indexPath.row, forKey: "ItemIndex")
        
        mainViewController.toCoverViewAction()
        
    }
    // CollevtionView End//
}
