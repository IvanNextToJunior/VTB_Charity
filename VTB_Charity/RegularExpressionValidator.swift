//
//  RegularExpressionValidator.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import Foundation

class RegularExpressionValidator: BaseValidator, ValidationHandler {
    
    var pattern: String
    
    init(pattern: String, message: String) {
        self.pattern = pattern
        super.init(message: message)
    }
    
    func validate(_ value: String) throws -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            
            if regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(message: message)
            }
        
        }
        catch {
            if error is ValidationError {
                throw error
            }
            
            throw ValidationError(message: error.localizedDescription)
        }
   
        return value
    }
    
}

