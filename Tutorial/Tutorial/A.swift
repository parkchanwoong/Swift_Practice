//
//  A.swift
//  Tutorial
//
//  Created by 박찬웅 on 2017. 9. 8..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class A: UIViewController {
    
// MARK: - Variable
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
// Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: - Action
    
    @IBAction func next(_ sender: Any) {
        
        titleLabel.text = "Bali"
        contentImageView.image = UIImage (named: "bali.png")
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        titleLabel.text = "Bora"
        contentImageView.image = UIImage (named: "bora.png")
        
    }
    // Action_End
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
