//
//  UIStoryboard.swift
//  SSRLabTest2
//
//  Created by Иван Селюк on 17.07.22.
//

import UIKit

extension UIViewController {
    static var getInstanceController: UIViewController? {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController()
    }
    
    func showAlert(with messageError: String) {
        let alert = UIAlertController(title: "Error", message: messageError, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}

