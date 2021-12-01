

import UIKit

@IBDesignable extension UIView{
    
    @IBInspectable var cornerRadius: CGFloat{
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    
    
    @IBInspectable var borderSize: CGFloat{
        set{
            layer.borderWidth = newValue
        }
        get{
            return layer.borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor{
        set{
            layer.borderColor = newValue.cgColor
        }
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    
}
