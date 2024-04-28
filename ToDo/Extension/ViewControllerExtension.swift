//
//  ViewControllerExtension.swift
//  ToDo
//
//  Created by Rafael González on 26/04/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func show(error: String) {
        let alert = UIAlertController(title: "Error", message:error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style:.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func show(warning: String) {
        let alert = UIAlertController(title: "Alerta",message: warning, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

