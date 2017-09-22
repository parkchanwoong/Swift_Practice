//
//  ViewController.swift
//  FireBaseTutorial
//
//  Created by 박찬웅 on 2017. 9. 18..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class Main: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    //MARK: - Variable
    
    var dataStruct = [data]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    // Variable End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Data //
        
        databaseReference.child("Post").observe(.childAdded, with: { snapshot in
            
            if let postDataDictionary = snapshot.value as? [String:AnyObject] {
                
                let postData = data()
                
                postData.profileImageURL = postDataDictionary["ProfileImageURL"] as! String
                postData.userName = postDataDictionary["UserName"] as! String
                postData.contentImageURL = postDataDictionary["ContentImageURL"] as! String
                postData.contentText = postDataDictionary["ContentText"] as! String
                
                self.dataStruct.insert(postData, at: 0)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
            
            
            
        })
        
        
        
        
    }
    //MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    //Status Bar End//
    
    //MARK: - Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataStruct.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let estimatedHeight = NSString(string: dataStruct[indexPath.row].contentText).boundingRect(with: CGSize(width: view.frame.width , height:1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font:UIFont.init(name: "Helvetica Neue", size: 14)!], context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedHeight.height + 345)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        
        // Data //
        
        let postData = dataStruct[indexPath.row]
        
        cell.userNameLabel.text = postData.userName
        cell.contentTextView.text = postData.contentText
        
        // profile Image//
        let profileImageURLAddress = postData.profileImageURL
        let profileImageURL = URL(string:profileImageURLAddress)
        
        URLSession.shared.dataTask(with:profileImageURL!){(data, response, error) in
            
            if error == nil {
                DispatchQueue.main.async {
                    
                    cell.profileImageView.image = UIImage(data: data!)
                    
                }
            }
            
            }.resume()
        
        
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.width/2
        cell.profileImageView.clipsToBounds = true   //view를 갖고 자름
        
        // Content Image//
        
        let contentImageURLAddress = postData.contentImageURL
        let contentImageURL = URL(string:contentImageURLAddress)
        
        URLSession.shared.dataTask(with:contentImageURL!){(data, response, error) in
            
            if error == nil {
                DispatchQueue.main.async {
                    
                    cell.contentImageView.image = UIImage(data: data!)
                    
                }
            }
            
            }.resume()
        
 
        cell.contentImageView.image = UIImage(named: postData.contentImageURL)
        cell.contentImageView.layer.masksToBounds = true //Layer을 자름
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    // CollectionView End//
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

