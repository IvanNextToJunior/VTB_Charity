//
//  CardEmissionModel.swift
//  VTB_Charity
//
//  Created by Ivan on 09.12.2021.
//

import Foundation
struct CardEmission: Codable {
    
    let maskedPan: String
    let embossingName: String
    let cardExpiry: String
    let publicId: String
    
}
