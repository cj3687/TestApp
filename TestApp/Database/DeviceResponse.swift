import ObjectMapper

class Device : Mappable {
    
    var name: String!
    var sipNumber: String!
    var xmppJid: String!
    var contactId: Int?
    var avatar: String?
    var write: Bool?
    var read: Bool?
    var call: Bool?
    
    var p2p: Bool?
    var id_companion: Int?
    
    var allow_notification = true
    var is_important = false
    
    var count: Int = 0
    var lastMessageDate = Date.distantPast
    
    required init?(map: Map) {
        
    }

    
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    func mapping(map: Map) {
        contactId <- map["id"]
        xmppJid <- map["jid"]
        sipNumber <- map["sipnumber"]
        name  <- map["name"]
        avatar <- map["avatar"]
        write <- map["write"]
        read  <- map["read"]
        call  <- map["call"]
        p2p  <- map["p2p"]
        id_companion  <- map["id_companion"]
        allow_notification <- map["notification"]
        is_important <- map["consolidate"]
        count <- map["user_number"]
    }
    
}

class DeviceResponse: BaseResponse {
    
    var device: [Device]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        device <- map["data"]
    }
}
