//
//  FlashView.swift
//  CustomAlerts
//
//  Created by Romain Menke on 29/10/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

extension UIView {
    
    func flash(times:Int, speed:NSTimeInterval) {
        
        if times == 0 {
            return
        }
        
        UIView.animateWithDuration(speed / 2, delay: 0.0, options: [], animations: { () -> Void in
            
            self.alpha = 0
            
            }) { (completed) -> Void in
                
                UIView.animateWithDuration(speed / 2, delay: 0.0, options: [], animations: { () -> Void in
                    
                    self.alpha = 1
                    
                    }) { (completed) -> Void in
                        
                        self.flash(times - 1, speed: speed)
                        //
                }
        }
    }
}