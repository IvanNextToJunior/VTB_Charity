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
   
    var userName: String {
        guard let customerName = userDefaults.string(forKey: nameKey) else {return ""}
        return customerName
    }
    
    var middleName: String {
        guard let customerPatronymic = userDefaults.string(forKey: middleNameKey) else {return ""}
        return customerPatronymic
    }
    
    var lastName: String {
        guard let customerLastName = userDefaults.string(forKey: lastNameKey) else {return ""}
        return customerLastName
    }



}
