//
//  APIManager.swift
//  VTB_Charity
//
//  Created by Ivan on 04.12.2021.
//

import Foundation

struct APIManager {
    
    //MARK: API References
    
//        "https://hackaton.bankingapi.ru/api/rb/dks/cardemission/hackathon/v1/prepaid?X-MDM-Id=id&Authorization=Bearer{token}&x-client-channel=team27@app.hackaton.bankingapi.ru&X-PARTNER-ID=15522222&body{partnerId=15522222}",
//        "https://hackaton.bankingapi.ru/api/rb/dks/cardops/hackathon/v1/pin/{publicId}?X-MDM-Id=id&Authorization=Bearer{token}&x-client-channel=team27@app.hackaton.bankingapi.ru&X-PARTNER-ID=15522222&publicId=1111111111111&body{pin:hssdsdssss,publicKeyId=1111111111111}"
   

    private func makeRequest(for urlString: String, with method: String, bodyParams: String, headers: [String:String]) -> URLRequest {
    
        
        guard let url = URL(string: urlString) else { fatalError()}
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = Data(base64Encoded: bodyParams)
        request.allHTTPHeaderFields = headers
        return request
    }

  //  func upload(result: ) ->   {
        
  //  }
  

}
