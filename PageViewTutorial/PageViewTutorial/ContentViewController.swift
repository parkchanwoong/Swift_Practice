//
//  ContentViewController.swift
//  PageViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 14..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    //MARK: -  Variable End
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    
    var pageIndex = Int()
    var contentImageName = String()
    var contentText = String()
    
    // Variable End
    
    //MARK: - status Bar
    
    override var prefersStatusBarHidden: Bool
    {
    return true
    }
    
    //Status Bar End
    
    override func viewDidLoad() {
        super.viewDidLoad()

    contentImageView.image = UIImage(named: contentImageName)
        
    contentTextView.text = contentText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
}
