//
//  TextLengthValidator.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import Foundation

class TextLengthValidator: BaseValidator, ValidationHandler {
    
    private var minTextLength: Int
    
    init(minTextLength: Int, message: String) {
        self.minTextLength = minTextLength
        super.init(message: message)
    }
    
    func validate(_ value: String) throws -> String {
        if value.count < minTextLength {
            throw ValidationError(message: message)
        }
        
        return value
    }
    
}
