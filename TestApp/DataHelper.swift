import Foundation
import Alamofire
import SwiftyJSON

class DataHelper {
    
    static let shared = DataHelper()
    
    func getDataFromURL(urlString: String,
                        parameters: [String: String],
                        completion: @escaping ([[String: String]]) -> (),
                        failureCompletion: @escaping (Error) -> ()) {
        var jsonString: [[String: String]]? = nil
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                switch response.result {
                case .success:
                    print("example success")
                    //to get JSON return value
                    if let array = response.result.value as? [[String: String]] {
                        jsonString = array
                    }
                    completion(jsonString!)
                    break
                case .failure:
                    failureCompletion(response.error!)
                    break
                }
                
            
        }
    }
    
}
