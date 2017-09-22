//
//  MainViewController.swift
//  TableViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 10..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    // MARK: - Variable
    
    var data = [String]()
    
    //Variable End
    
    
    //MARK: - Status Bar
    
    override var prefersStatusBarHidden: Bool {return true}
    
    //Status Bar_End
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainTableViewCell
        
        cell.titleLabel.text = data[indexPath.row]
        
        return cell
    }
  
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            data.remove(at: indexPath.row)
            
            UserDefaults.standard.set(data, forKey: "data")
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UserDefaults.standard.set(indexPath.row, forKey: "order")
        // later
        performSegue(withIdentifier: "toMemo", sender: self)
        
    }
    
    // TableView End
    
    //MARK: = Action
    @IBAction func addAction(_ sender: Any)
    {
        UserDefaults.standard.set(-1, forKey: "order")
    }
    
    //Action End
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
