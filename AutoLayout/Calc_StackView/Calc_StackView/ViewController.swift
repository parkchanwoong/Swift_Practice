//
//  ViewController.swift
//  Calc_StackView
//
//  Created by 박찬웅 on 2017. 8. 23..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button9: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button9.layer.borderColor = UIColor.black.cgColor
        button9.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

