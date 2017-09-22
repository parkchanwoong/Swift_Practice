//
//  SupportingData.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 18..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit
import Firebase

//MARK: - Variable
let signBorderColor = UIColor(red: 255/255, green: 138/255, blue: 127/255, alpha: 1.0).cgColor


// FireBase //
let databaseReference = FIRDatabase.database().reference()
let storageReference = FIRStorage.storage().reference()

// Variable_End



//MARK:- Data
class data {
    
    var profileImageURL = String()
    var userName = String()
    var contentText = String()
    var contentImageURL = String()
}

//Data _End

class SupportingData: NSObject {

}
