//
//  SlideOut.swift
//  PageViewTutorial
//
//  Created by 박찬웅 on 2017. 9. 14..
//  Copyright © 2017년 Parkchanwoong. All rights reserved.
//

import UIKit

class SlideLeft: UIStoryboardSegue {
    
    override func perform() {
        
        let Source = self.source
        let Destination = self.destination
        
        Source.view.superview?.insertSubview(Destination.view, aboveSubview: Source.view)
        
        Destination.view.transform = CGAffineTransform(translationX: -source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            Destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },completion:{finished in Source.present(Destination, animated: false, completion: nil)})
        
    }
    
    
}

class SlideRight: UIStoryboardSegue {
    
    override func perform() {
        
        let Source = self.source
        let Destination = self.destination
        
        Source.view.superview?.insertSubview(Destination.view, aboveSubview: Source.view)
        
        Destination.view.transform = CGAffineTransform(translationX: +source.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            Destination.view.transform = CGAffineTransform(translationX: 0, y: 0)
        },completion:{finished in Source.present(Destination, animated: false, completion: nil)})
        
    }
    
    
}
