//
//  Intro.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 19..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase


class Intro: UIViewController {
    //MARK: - Variable
    
    
    
    
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    // Variable_End
    
    //MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool{return true}
    
    //Status Bar End//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Supporting View //
        
        let signVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignIn
        signVC.view.frame = signView.bounds
        signView.addSubview(signVC.view)
        addChildViewController(signVC)
        signVC.didMove(toParentViewController: self)
        
        let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! Main
        mainVC.view.frame = signView.bounds
        mainView.addSubview(mainVC.view)
        addChildViewController(mainVC)
        mainVC.didMove(toParentViewController: self)
        
    
        
        // Sign In //
        
        if FIRAuth.auth()?.currentUser != nil{
            
            signView.isHidden = true
        }
    }

}
