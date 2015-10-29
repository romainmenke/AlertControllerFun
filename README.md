# AlertControllerFun
just some fun with UIAlertController

Two recursive functions that dissect default UI objects so you can alter how they look/work.


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
