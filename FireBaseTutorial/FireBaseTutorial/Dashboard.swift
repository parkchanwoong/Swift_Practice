//
//  Dashboard.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 19..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase

class Dashboard: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //MARK: - Variable
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    
    // Variable End //

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User Information //
        
        let userID = FIRAuth.auth()?.currentUser?.uid
        
        databaseReference.child("User").child(userID!).observeSingleEvent(of: FIRDataEventType.value, with: {snapshot in
            if let userDictionary = snapshot.value as? [String:AnyObject] {
                
                
                let profileimageURLAddress = userDictionary["profileImageURL"] as! String
                
                let profileImageURL = URL(string: profileimageURLAddress)
                
                URLSession.shared.dataTask(with: profileImageURL!) {(data,response,error) in
                 
                    if error == nil {
                        
                        DispatchQueue.main.async {
                            self.profileImageView.image = UIImage(data:data!)
                        }
                        
                    }
                    
                }.resume()
                
                let userName = userDictionary["userName"] as! String
                self.userNameLabel.text = userName
                
            }
        
        
        
        
        
        
        
        
        
        })
        
        
        // Profile Image//
        
        
        self.profileImageView.layer.borderWidth = 1
        self.profileImageView.layer.borderColor = UIColor.white.cgColor
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        self.profileImageView.clipsToBounds = true

        
    }
    
    
    //MARK: - Action
    
    //Change Profile Image //
    
    @IBAction func changeProfileImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true , completion: nil)
        
        
        
    }
    // Sign Out //
    
    @IBAction func signOut(_ sender: Any) {
        
        try! FIRAuth.auth()!.signOut()
        
        performSegue(withIdentifier: "toSignIn", sender: self)
        
    }
    // Action_end
    

    
    
    
    
    
    //MARK: - Function
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImage = UIImage()
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            selectedImage = editedImage
            
        } else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            selectedImage = originalImage
        }
        
        profileImageView.image = selectedImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Function_End

    
    }
