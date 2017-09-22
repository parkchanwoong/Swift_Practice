//
//  CellBCollectionViewCell.swift
//  CollectionViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 13..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class CellBCollectionViewCell: UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Variable
    
    @IBOutlet weak var itemGroupTitleLabel: UILabel!
    
    var itemGroupData = ItemGroup()
    var itemGroupIndex = Int()
    
    var mainViewController = Main()
    // Variable End
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 40) / 3, height: 99)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let ItemCellBCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCellB", for: indexPath) as! ItemCellBCollectionViewCell
        
        
        
        let itemImageName = itemGroupData.ItemSet[indexPath.row].ItemImageName
        ItemCellBCollectionViewCell.itemImageView.image = UIImage(named: itemImageName)
        
        ItemCellBCollectionViewCell.itemImageView.layer.cornerRadius = 10
        ItemCellBCollectionViewCell.itemImageView.layer.masksToBounds = true
        
        ItemCellBCollectionViewCell.itemTitleLabel.text = itemGroupData.ItemSet[indexPath.row].ItemTitleLabel
        
        return ItemCellBCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSDefault.set(itemGroupIndex, forKey: "ItemGroupIndex")
        NSDefault.set(indexPath.row, forKey: "ItemIndex")
        
        mainViewController.toCoverViewAction()

    }
    // CollevtionView End//
    
}
