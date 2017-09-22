//
//  MemoViewController.swift
//  TableViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 11..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController {
    
    
    override var prefersStatusBarHidden: Bool {return true}
    
    
//MARK: = Variable
    
    @IBOutlet weak var contentTextView: UITextView!
    
    var data = [String]()
    var order = Int()
    
// Variable_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        
        order = UserDefaults.standard.object(forKey: "order") as! Int
        
        if order >= 0 {
            contentTextView.text = data[order]
        } else {
            contentTextView.text = "..."
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Action
    
    @IBAction func saveAction(_ sender: Any)
    {
        order = UserDefaults.standard.object(forKey: "order") as! Int
        
        if order >= 0 {
            
            data.remove(at: order)
            data.insert(contentTextView.text, at: 0)
            UserDefaults.standard.set(data, forKey: "data")
            
        } else {
            data.insert(contentTextView.text, at: 0)
            
            UserDefaults.standard.set(data, forKey: "data")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
