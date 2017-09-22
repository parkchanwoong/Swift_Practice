//
//  SignUp.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 19..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase

class SignIn: UIViewController {
    //MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool{return true}
    
    //Status Bar End//
    
    
    
    //MARKL = Variable
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
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
        
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = signBorderColor
        passwordTextField.layer.cornerRadius = 20
        
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = signBorderColor
        signInButton.layer.cornerRadius = 20
        
        
        
    }
    
    
    
    
    //MARK: - Action
    
    @IBAction func singInAcion(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    
                    switch errorCode {
                    case.errorCodeInvalidEmail:
                        
                        let alertController = UIAlertController(title: "FireBaseGram", message: "이메일 주소를 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alertController , animated: true, completion: nil)
                        
                    case.errorCodeUserNotFound:
                        
                        let alertController = UIAlertController(title: "FireBaseGram", message: "등록되어 있지 않네요", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alertController , animated: true, completion: nil)
                        
                    case.errorCodeWrongPassword:
                        
                        let alertController = UIAlertController(title: "FireBaseGram", message: "비밀번호 오류 입니다", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alertController , animated: true, completion: nil)
                        
                    default:
                        
                        print("Sign In Error : \(error!)")
                        
                        
                    }
                }
                
            } else {
                
                let alertController = UIAlertController(title: "FireBaseGram", message: "다시 오셨네요, 반갑습니다", preferredStyle: UIAlertControllerStyle.alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{action in self.performSegue(withIdentifier: "toMain", sender: self)} ))
                
                self.present(alertController , animated: true, completion: nil)

                
            }
        })
        
    }
    
    
    //MARK: - Function
    
    @objc func dismissKeyboard(_sender: AnyObject){
        view.endEditing(true)
    }
    
    
}
