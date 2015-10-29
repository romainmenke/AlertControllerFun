# AlertControllerFun
just some fun with UIAlertController

A recursive function that dissects default UI objects. It prints some info so you can find what you need.


    extension UIViewStack {
    
        func printSubviewStack() {
            getSubviewStackRecursive([])
        }
    
        private func getSubviewStackRecursive(levels: [Int]) {
        
            var currentLevels = levels
            currentLevels.append(0)
        
            for i in 0..<subviews.count {
            
                currentLevels[currentLevels.count - 1] = i
            
                let subview = subviews[i]
            
                if subview is UILabel {
                    print("Label")
                }
            
                if subview is UICollectionViewCell {
                    print("Cell")
                }
            
                print(subview.frame, "depth:", currentLevels)
                subview.getSubviewStackRecursive(currentLevels)
            }
        }
    }
  
  
Fetch subviews with the printed addresses.
  
  
    extension UIView {
        
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
