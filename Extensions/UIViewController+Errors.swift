//
//  UIViewController+Errors.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showError(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
