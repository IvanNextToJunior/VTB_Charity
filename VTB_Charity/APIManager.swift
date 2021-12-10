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
   

    private func makeRequest(for urlString: String, with method: String, bodyParams: Data, headers: [String:String]?) -> String {
        
        var token: String = ""
        
        guard let url = URL(string: urlString) else { fatalError()}
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = bodyParams
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        
        task.resume()
        
        return token
    }
    
    public func getToken() {
        let postData = NSMutableData(data: "grant_type=client_credentials".data(using: String.Encoding.utf8)!)
        postData.append("&client_id=team27@app.hackaton.bankingapi.ru".data(using: String.Encoding.utf8)!)
        postData.append("&client_secret=OHR52sRk".data(using: String.Encoding.utf8)!)
        
        
        print(self.makeRequest(for: "https://hackaton.bankingapi.ru/passport/oauth2/token", with: "POST", bodyParams: postData as Data, headers: nil))
    }

  //  func upload(result: ) ->   {
        
  //  }
  

    
//    func shomasToken() -> String? {
//        
//        var token: String? = nil
//        
//
//
//        var request = URLRequest(url: URL(string: "https://hackaton.bankingapi.ru/passport/oauth2/token")!)
//        request.httpMethod = "POST"
//        request.httpBody = postData as Data
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            print(response!)
//            do {
//                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
//                print(json["access_token"] ?? "error gettin' token :C")
//                token = ""
//            } catch {
//                print("error")
//            }
//        })
//
//        task.resume()
//        return token
//    }
}
