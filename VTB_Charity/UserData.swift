//
//  UserData.swift
//  VTB_Charity
//
//  Created by Ivan on 25.11.2021.
//

import Foundation

class UserData {
    
    private let nameKey = "Name"
    private let lastNameKey = "Last name"
    private let middleNameKey = "Middle name"
    private let userDefaults = UserDefaults()
    
 func getUser (name: String, lastName: String, middleName: String) {
        userDefaults.setValue(name, forKey: nameKey)
        userDefaults.setValue(lastName, forKey: lastNameKey)
        userDefaults.setValue(middleName, forKey: middleNameKey)
    }
    var fullName: String {
        
        let name = userDefaults.object(forKey: nameKey) as! String
        let lastName = userDefaults.object(forKey: lastNameKey) as! String
        let middleName = userDefaults.object(forKey: middleNameKey) as! String
      
        let userName = name + middleName + lastName
        print(userName)
        
        return userName
    }
}
