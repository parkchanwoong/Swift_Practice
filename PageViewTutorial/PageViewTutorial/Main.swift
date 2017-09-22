//
//  ViewController.swift
//  CollectionViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 13..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit



class Main: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    //MARK: - Variable
    
    var itemGroupSetData = [ItemGroup]()
    
    //Variable End

    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemGroupSetData = ItemGroup().AddItem()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: - CollectionView
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemGroupSetData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 1 {
            
            return CGSize(width: view.frame.width, height: 140)
        }
        
        return CGSize(width: view.frame.width, height: 450)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if indexPath.row == 1{
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "CellB", for: indexPath) as! CellBCollectionViewCell
            cellB.itemGroupData = itemGroupSetData[indexPath.row]
            cellB.itemGroupTitleLabel.text = itemGroupSetData[indexPath.row].ItemGroupTitleLabel
            
            cellB.itemGroupIndex = indexPath.row
            
            cellB.mainViewController = self
            return cellB
        }
        
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "CellA", for: indexPath) as! CellACollectionViewCell
        
        cellA.itemGroupData = itemGroupSetData[indexPath.row]
        cellA.itemGroupTitleLabel.text = itemGroupSetData[indexPath.row].ItemGroupTitleLabel
        
        cellA.itemGroupIndex = indexPath.row
        
        cellA.mainViewController = self
        
        return cellA
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
//CollectionView End
    
    //MARK: - Action
    
    func toCoverViewAction(){
        
        performSegue(withIdentifier: "toCover", sender: self)
    }
    
    
    //Action //
}

