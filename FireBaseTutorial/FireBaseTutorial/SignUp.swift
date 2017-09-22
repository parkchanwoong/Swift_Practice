//
//  SignUp.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 19..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase

class SignUp: UIViewController {
    //MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool{return true}
    
    //Status Bar End//
    
    
    
    //MARKL = Variable
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    //Variable_End
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Gesture //
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_sender:)))
        view.addGestureRecognizer(tapGesture)
        
        
        
        // LayOut //
        
        userNameTextField.layer.borderWidth = 1
        userNameTextField.layer.borderColor = signBorderColor
        userNameTextField.layer.cornerRadius = 20
        
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = signBorderColor
        emailTextField.layer.cornerRadius = 20
        
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = signBorderColor
        passwordTextField.layer.cornerRadius = 20
        
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = signBorderColor
        signUpButton.layer.cornerRadius = 20
        
        
        
    }
    
    
    
    
    //MARK: - Action
    
    @IBAction func singUpAcion(_ sender: Any) {
        
        if userNameTextField.text == "" || userNameTextField.text == "Username" {
            let alertController = UIAlertController(title: "FireBaseGram", message: "유저네임을 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
            
            present(alertController, animated: true, completion: nil)
            
        } else if emailTextField.text == "" || emailTextField.text == "Email Address" {
            let alertController = UIAlertController(title: "FireBaseGram", message: "이메일 주소를 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
            
            present(alertController, animated: true, completion: nil)
            
            
        } else if passwordTextField.text == "" || passwordTextField.text == "Password" {
            let alertController = UIAlertController(title: "FireBaseGram", message: "비밀번호를 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
            
            present(alertController, animated: true, completion: nil)
            
            
        } else {
            
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil {
                    
                    if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                        
                        switch errorCode {
                            
                        case.errorCodeInvalidEmail:
                            
                            let alertController = UIAlertController(title: "FireBaseGram", message: "이메일 주소를 입력해 주세요", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                        case.errorCodeEmailAlreadyInUse:
                            
                            let alertController = UIAlertController(title: "FireBaseGram", message: "이미 가입한 회원 입니다", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                        case.errorCodeWeakPassword:
                            
                            let alertController = UIAlertController(title: "FireBaseGram", message: "비밀번호는 6자 이상으로 해주세요", preferredStyle: UIAlertControllerStyle.alert)
                            
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                        default:
                            
                            print("Create User Error : \(error!)")
                        }
                    }
                    
                } else {
                    
                    
                    let alertController = UIAlertController(title: "FireBaseGram", message: "환영합니다", preferredStyle: UIAlertControllerStyle.alert)
                    
                    
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in self.signIn()}))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
            
        }
        
    }
    
    
    //MARK: - Function
    
    // Sign In //
    
    func signIn() {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: {
            
            user, error in
            
            let userData: [String:String] = ["userName":self.userNameTextField.text!, "profileImageURL":"https://firebasestorage.googleapis.com/v0/b/fir-gram-ebf6f.appspot.com/o/ProfileImage%403x.png?alt=media&token=66a7bd9b-c507-4376-9c4a-fddb1fe095ac"]
            
            let userID = FIRAuth.auth()?.currentUser?.uid
            
            databaseReference.child("User").child(userID!).updateChildValues(userData)
            
            self.performSegue(withIdentifier: "toMain", sender: self)
        })
        
    }
    
    
    // Keyboard //
    @objc func dismissKeyboard(_sender: AnyObject){
        view.endEditing(true)
    }
    
    
}
