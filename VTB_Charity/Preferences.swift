//
//  Preferences.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import Foundation
import KeychainAccess
struct Preferences {
    
    private static let keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    
    fileprivate enum Keys: String {
        case password
    }
   
    static var password: String? {
        get {
            keychain[Keys.password]
        }
        set {
            keychain[Keys.password] = newValue
        }
    }

    static var hasPassword: Bool {
       password != nil && !password!.isEmpty
    }
    
    static func reset () {
       password = nil
    }
}

extension Keychain {
    
    private func sanitizeValue(_ value: String?) -> String? {
        value?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    fileprivate subscript(key: Preferences.Keys) -> String? {
        get {
            self[key.rawValue]
        }
        set {
            self[key.rawValue] = sanitizeValue(newValue)
        }
    }

}
