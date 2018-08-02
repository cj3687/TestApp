import Foundation
import Alamofire
import SwiftyJSON

class DataHelper {
    
    static let shared = DataHelper()
    
    func getJSONDataFromURL(urlString2: String) {
        let urlString = "https://swift.mrgott.pro/blog.json"
    
        let parameters: [String: String] = [
            "token" : "7aa8c24da8b0912b8d4284f84c8e5fa75b7ab9efc29bfec0",
            "device" : "Honor",
            "limit" : "5"
        ]
        
        Alamofire.request("https://fonoapi.freshpixl.com/v1/getdevice", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
        }
        
    }
    
}
