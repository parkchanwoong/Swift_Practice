//
//  ConnectionViewController.swift
//  PageViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 14..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController,UIPageViewControllerDataSource {

    //MARK: - Variable
    
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    @IBOutlet weak var pageView: UIView!
    var ItemGroupIndex = Int()
    var Itemindex = Int()
    
    var ItemGroupSetData = [ItemGroup]()
    var ItemGroupData = ItemGroup()
    var ItemData = Item()
    
    var ContentImageData = NSArray()
    var ContentTextData = NSArray()
    
    //Variable End
    
    //MARK: - status Bar
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    //Status Bar End
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImageName = NSDefault.object(forKey: "connectionBackgroundImageName") as! String
        
        backGroundImageView.image = UIImage(named: backgroundImageName)
        
        
        
        // Data //
        ItemGroupIndex = NSDefault.object(forKey: "ItemGroupIndex") as! Int
        Itemindex = NSDefault.object(forKey: "ItemIndex") as! Int
        
        ItemGroupSetData = ItemGroup().AddItem()
        ItemGroupData = ItemGroupSetData[ItemGroupIndex]
        ItemData = ItemGroupData.ItemSet[Itemindex]

        ContentImageData = ItemData.ContentImageData
        ContentTextData = ItemData.ContentTextData
        
        //Lay Out//
        let initialView = contentViewControllerIndex(index: 0)
        
        let viewController = NSArray(object: initialView)
        
        
        
        // Page View //
        
        let pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as! UIPageViewController
        
        
        pageViewController.view.frame = pageView.bounds
        pageView.addSubview(pageViewController.view)
        addChildViewController(pageViewController)
        pageViewController.didMove(toParentViewController: self)
        pageViewController.dataSource = self
        pageViewController.setViewControllers(viewController as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
 
        
    }
    
    
    // MARK: - Page View
    
    func contentViewControllerIndex(index: Int) -> ContentViewController
    {
        if ContentTextData.count == 0 || index >= ContentTextData.count || ContentImageData.count == 0{
            return ContentViewController()
        }
        
        let contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        
        contentViewController.pageIndex = index
        contentViewController.contentImageName = ContentImageData[index] as! String
        contentViewController.contentText = ContentTextData[index] as! String
        
        return contentViewController
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentViewController = viewController as! ContentViewController
        var pageIndex = contentViewController.pageIndex as Int
        
        if pageIndex == 0  || pageIndex == NSNotFound
        {
            return nil
        }
        
        pageIndex -= 1
        
        return contentViewControllerIndex(index: pageIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let contentViewController = viewController as! ContentViewController
        var pageIndex = contentViewController.pageIndex as Int
        
        if pageIndex == NSNotFound {
            return nil
        }
        
        pageIndex += 1
        
        if pageIndex == ContentTextData.count {
            return nil
        }
        
        return contentViewControllerIndex(index: pageIndex)

    }
    
    //Page View End
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
