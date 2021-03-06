//
//  DissectSubviews.swift
//  CustomAlerts
//
//  Created by Romain Menke on 29/10/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


protocol UIViewStack {
    
    var subviews : [UIView] {
        get
    }
}

extension UIViewStack {
    
    func printSubviewStack() {
        getSubviewStackRecursive([])
    }
    
    // this prints an address for each subview, add type checks to find what you need
    private func getSubviewStackRecursive(levels: [Int]) {
        
        func printInfo(type:String,frame:CGRect,printLevels:[Int]) {
            
            let x = NSString(format: "%.0f", frame.origin.x)
            let y = NSString(format: "%.0f", frame.origin.y)
            let w = NSString(format: "%.0f", frame.size.width)
            let h = NSString(format: "%.0f", frame.size.height)
            
            print("origin:",x,y)
            print("size:",w,h)
            print("type:",type)
            
            print("address:",printLevels)
            print("")
        }
        
        var currentLevels = levels
        currentLevels.append(0)
        
        for i in 0..<subviews.count {
            
            currentLevels[currentLevels.count - 1] = i
            
            let subview = subviews[i]
            
            switch subview {
            case is UILabel :
                printInfo("Label", frame: subview.frame, printLevels: currentLevels)
            case is UICollectionViewCell :
                printInfo("cvCell", frame: subview.frame, printLevels: currentLevels)
            case is UICollectionView :
                printInfo("CollectionView", frame: subview.frame, printLevels: currentLevels)
            default :
                printInfo("UIView", frame: subview.frame, printLevels: currentLevels)
            }

            subview.getSubviewStackRecursive(currentLevels)
        }
    }
}


extension UIView: UIViewStack {
    
}

extension UIView {
    
    // use the printed addresses to access the views. This is safe even if the UIView changes in an update.
    func getSubView(withAddress address:[Int]) -> UIView? {
        return getSubviewFromAddressRecursive(self, address: address)
    }
    
    private func getSubviewFromAddressRecursive(superView:UIView, address:[Int]) -> UIView? {
        
        var currentView : UIView = superView
        
        for index in address {
            
            guard currentView.subviews.count > index else {
                return nil
            }
            currentView = currentView.subviews[index]
            
        }
        return currentView
    }
}
