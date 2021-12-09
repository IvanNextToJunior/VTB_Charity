//
//  APIManager.swift
//  VTB_Charity
//
//  Created by Ivan on 04.12.2021.
//

import Foundation

struct APIManager {
    
    //MARK: API References
    var links = [
        "https://hackaton.bankingapi.ru/api/rb/dks/cardemission/hackathon/v1/prepaid?X-MDM-Id=id&Authorization=Bearer{token}&x-client-channel=team27@app.hackaton.bankingapi.ru&X-PARTNER-ID=15522222&body{partnerId=15522222}",
        "https://hackaton.bankingapi.ru/api/rb/dks/cardops/hackathon/v1/pin/{publicId}?X-MDM-Id=id&Authorization=Bearer{token}&x-client-channel=team27@app.hackaton.bankingapi.ru&X-PARTNER-ID=15522222&publicId=1111111111111&body{pin:hssdsdssss,publicKeyId=1111111111111}"
   ]

    func getRequest(for urlAtIndex: Int, with method: String) -> URLRequest {
       
        let urlString = links[urlAtIndex]
        guard let url = URL(string: urlString) else { fatalError()}
        var request = URLRequest(url: url)
        request.httpMethod = method
         
        return request
    }

    func parseResponse(for urlAtIndex: Int, with method: String) {
        let request = getRequest(for: urlAtIndex, with: method)
        
    }

}
