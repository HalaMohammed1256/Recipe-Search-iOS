//
//  UIViewController+Extension.swift
//  Recipe-Search-iOS
//
//  Created by Hala on 28/11/2021.
//

import UIKit
import SafariServices


extension UIViewController{
    
    func showAlert(title: String?, message: String?, style: UIAlertController.Style, okName: String = "Ok", okHandler: ((UIAlertAction) -> Void)?, cancelName: String = "Cancel", cancelHandler: ((UIAlertAction) -> Void)?, isShowCancel: Bool){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        
        let okButton = UIAlertAction(title: okName, style: .default, handler: okHandler)
        let cancelButton = UIAlertAction(title: cancelName, style: .default, handler: cancelHandler)

        
        alert.addAction(okButton)
        
        if isShowCancel == true{
            alert.addAction(cancelButton)
        }
        
        
        self.present(alert, animated: true)
    }
    
    
    func openInsideUrl(url_string: String?){
        if let url_string = url_string, let url = URL(string: url_string){
            let configuration = SFSafariViewController.Configuration()
            configuration.entersReaderIfAvailable = true
            let viewController = SFSafariViewController(url: url, configuration: configuration)
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    
}

