//
//  ErrorValidation.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import Foundation

protocol ValidationHandler {
    func validate (_ value: String) throws -> String
}

class ValidationError: Error {
    
    var message: String
    
    init (message: String) {
        self.message = message
    }
}
