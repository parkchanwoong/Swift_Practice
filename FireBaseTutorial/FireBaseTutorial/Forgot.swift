//
//  SignUp.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 19..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase
class Forgot: UIViewController {
    //MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool{return true}
    
    //Status Bar End//
    
    
    
    //MARKL = Variable
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    
    //Variable_End
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Gesture //
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_sender:)))
        view.addGestureRecognizer(tapGesture)
        
        
        
        // LayOut //
        
        
        
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = signBorderColor
        emailTextField.layer.cornerRadius = 20
        
    
        
        findButton.layer.borderWidth = 1
        findButton.layer.borderColor = signBorderColor
        findButton.layer.cornerRadius = 20
        
        
        
    }
    
    
    
    
    //MARK: - Action
    
    @IBAction func findPasswordAction(_ sender: Any) {
        
        if self.emailTextField.text == "" {
            
            let alertController = UIAlertController(title: "FireBaseGram", message: "이메일 주소를 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController , animated: true, completion: nil)

            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
                
                var message = ""
                
                if error != nil {
                    message = (error?.localizedDescription)!
                } else {
                    message = "비밀번호 변경방법을 이메일로 보내드렸습니다."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: "FireBaseGram", message: message, preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                self.present(alertController , animated: true, completion: nil)
                
                
            })
        }
        
    }
    
    
    //MARK: - Function
    
    @objc func dismissKeyboard(_sender: AnyObject){
        view.endEditing(true)
    }
    
    
}
