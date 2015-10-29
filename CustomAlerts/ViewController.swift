//
//  ViewController.swift
//  CustomAlerts
//
//  Created by Romain Menke on 29/10/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class CustomAlartController : UIAlertController {
    
    override func viewWillAppear(animated: Bool) {
        customStyles()
    }
    
    
    func customStyles() {
        
        if let titleBackground = getSubviewFromAddress(self.view, address: [0, 1, 0, 0]) {
            titleBackground.backgroundColor = UIColor.redColor()
        }
        
        if let titleLabel = getSubviewFromAddress(self.view, address: [0, 1, 0, 0, 0, 0]) {
            self.flashView(titleLabel, times: 3, speed: 0.5)
        }
        
        if let firstCellSubView = getSubviewFromAddress(self.view, address: [0, 1, 0, 2, 0, 0]) {
            let rectHeight = firstCellSubView.frame.height / 4 * 3
            let margin = firstCellSubView.frame.height / 8
            
            let rect = CGRect(x: margin, y: margin, width: rectHeight, height: rectHeight)
            
            let imageView = UIImageView(frame: rect)
            imageView.image = UIImage(named: "sneaky")
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            firstCellSubView.addSubview(imageView)
            firstCellSubView.backgroundColor = UIColor.blackColor()
        }
        
    }
    
    func getSubviewFromAddress(superView:UIView, address:[Int]) -> UIView? {
        
        var currentView : UIView = superView
        
        for index in address {
            
            guard currentView.subviews.count > index else {
                return nil
            }
            
            currentView = currentView.subviews[index]
            
        }
        
        return currentView
        
    }
    
    func flashView(view:UIView,times:Int, speed:NSTimeInterval) {
        
        if times == 0 {
            return
        }
        
        UIView.animateWithDuration(speed / 2, delay: 0.0, options: [], animations: { () -> Void in
            
            view.alpha = 0
            
            }) { (completed) -> Void in
                
                UIView.animateWithDuration(speed / 2, delay: 0.0, options: [], animations: { () -> Void in
                    
                    view.alpha = 1
                    
                    }) { (completed) -> Void in
                        
                        self.flashView(view, times: times - 1, speed: speed)
                        //
                }
                //
        }
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let action1 = UIAlertAction(title: "Proceed With Caution", style: UIAlertActionStyle.Default) { (completed) -> Void in
            //
        }
        
        let action2 = UIAlertAction(title: "Find Rock And Hide", style: UIAlertActionStyle.Default) { (completed) -> Void in
            //
        }
        
        let action3 = UIAlertAction(title: "Let Mate Go First", style: UIAlertActionStyle.Default) { (completed) -> Void in
            //
        }
        
        let action4 = UIAlertAction(title: "Danger Is My ... sounds of breaking bones", style: UIAlertActionStyle.Default) { (completed) -> Void in
            //
        }
        
        let alertController = CustomAlartController(title: "Danger!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        alertController.addAction(action4)
        
        let attributedString = NSAttributedString(string: "Danger!", attributes: [
            NSForegroundColorAttributeName : UIColor.yellowColor()
            ])
        
        alertController.setValue(attributedString, forKey: "attributedTitle")
        
        presentViewController(alertController, animated: true) { () -> Void in
            //
            self.subViewStack(alertController.view, levels: [])
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func subViewStack(view:UIView, levels: [Int]) {
        
        var currentLevels = levels
        currentLevels.append(0)
        
        for i in 0..<view.subviews.count {
            
            currentLevels[currentLevels.count - 1] = i
            
            let subView = view.subviews[i]
            
            if subView is UILabel {
                print("Label")
            }
            
            if subView is UICollectionViewCell {
                print("Cell")
            }
            
            print(subView.frame, "depth:", currentLevels)
            subViewStack(subView, levels: currentLevels)
            
        }
        
    }

}

