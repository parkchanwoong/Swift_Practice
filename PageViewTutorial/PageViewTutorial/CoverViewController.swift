//
//  ContentViewController.swift
//  CollectionViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 13..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController {

    //MARK: - Variable
    
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var platformLabel: UILabel!
    
    
    
    
    var ItemGroupIndex = Int()
    var Itemindex = Int()
    
    var ItemGroupSetData = [ItemGroup]()
    var ItemGroupData = ItemGroup()
    var ItemData = Item()
    
    
    var contentImageName = String()
    //Variable End
    
    //MARK: - status Bar
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    //Status Bar End
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Data //
        ItemGroupIndex = NSDefault.object(forKey: "ItemGroupIndex") as! Int
        Itemindex = NSDefault.object(forKey: "ItemIndex") as! Int
        
        ItemGroupSetData = ItemGroup().AddItem()
        ItemGroupData = ItemGroupSetData[ItemGroupIndex]
        ItemData = ItemGroupData.ItemSet[Itemindex]
        
        contentImageName = ItemData.CoverImageName
        
        backGroundImageView.image = UIImage(named: contentImageName)
        
        
        genreLabel.text = ItemData.Genre
        dateLabel.text = ItemData.Date
        platformLabel.text = ItemData.Platform
        
        // Gesture //
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(self.toConnectionViewAction))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        
        view.addGestureRecognizer(leftSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Action
    
    func toConnectionViewAction(){
        NSDefault.set(contentImageName, forKey: "connectionBackgroundImageName")
        performSegue(withIdentifier: "toConnection", sender: self)
    }
    
    
    //Action //


    
}
