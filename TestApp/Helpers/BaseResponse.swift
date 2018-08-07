import AlamofireObjectMapper
import ObjectMapper

class BaseResponse : Mappable {
    
    required init?(map: Map) {}
    
    open var name: String?
    open var resolution: String?
    open var announced: String?
    open var features: String?
    
    func mapping(map: Map) {
        name <- map["name"]
        resolution <- map["resolution"]
        announced <- map["announced"]
        features <- map["features"]
    }
}
