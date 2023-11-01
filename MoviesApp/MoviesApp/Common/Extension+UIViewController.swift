//
//  Extension+UIViewController.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import UIKit
import NetworkKit
import KRProgressHUD

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    func showLoading() {
        KRProgressHUD.show()
    }
    
    func hideLoading() {
        KRProgressHUD.dismiss()
    }
    
    func showAlert(with title: String?, message: String, handler: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) {_ in
            handler?()
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func handleError(with error: AppError) {
        showAlert(with: "Error", message: error.errorDescription.defaultIfEmpty, handler: nil)
    }
    
}
