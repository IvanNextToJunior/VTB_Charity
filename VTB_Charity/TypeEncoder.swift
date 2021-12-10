//
//  TypeEncoder.swift
//  VTB_Charity
//
//  Created by Ivan on 11.12.2021.
//

import Foundation
struct TypeEncoder: Encodable {

    private let _encode: (Encoder) throws -> Void
   
    init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }

    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}
