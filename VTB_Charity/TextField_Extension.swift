//
//  TextField_Extension.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import UIKit

extension UITextField {
   
    var isValidated: Bool {
        self.text != ""
    }
  
    func validateText(validators: [ValidationHandler]) throws -> String {
        var result = ""
        
        try validators.forEach {
            result = try $0.validate(self.text!)
        }
        
        return result
    }
}

