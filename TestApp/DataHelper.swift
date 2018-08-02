import Foundation
import Alamofire
import SwiftyJSON

class DataHelper {
    
    static let shared = DataHelper()
    
    struct DataJsonStuff: Decodable {
        let data: [DataArray]
    }
    
    
    struct DataArray: Codable {
        let id: String?
        let type: String?
        let links: String?
        let attributes: String?

        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case links = "links"
            case attributes = "attributes"

        }
    }
    
    func getDataFromURL(urlString2: String) -> [[String: Any]]? {
        let urlString = "https://swift.mrgott.pro/blog.json"
        var jsonString: [[String: Any]]? = nil
        let parameters: [String: String] = [
            "token" : "7aa8c24da8b0912b8d4284f84c8e5fa75b7ab9efc29bfec0",
            "device" : "Honor",
            "limit" : "5"
        ]
        
        Alamofire.request("https://fonoapi.freshpixl.com/v1/getdevice", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let array = response.result.value as? [[String: Any]] {
                    //If you want array of task id you can try like
                    let taskArray = array.flatMap { $0["task_id"] as? String }
                    print(taskArray)
                    jsonString = array
                }
            
        }
        return jsonString
    }
    
}
