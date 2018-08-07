import Foundation
import SQLite

class DeviceEntity {
    static let shared = DeviceEntity()
    
    public var devicesList: [[String: String]]?  = [[:]]
    private let tableDeviceInfo = Table("tableDeviceInfo")
    
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("DeviceName")
    private let resolution = Expression<String>("resolution")
    private let announced = Expression<String>("announced")
    private let features = Expression<String>("features_c")
    
    private init() {
        do {
            if let connection = DataBase.shared.connection {
                try connection.run(tableDeviceInfo.create(temporary: false, ifNotExists: true, withoutRowid: false, block: { (table) in
                    table.column(self.id, primaryKey: true)
                    table.column(self.name)
                    table.column(self.resolution)
                    table.column(self.announced)
                    table.column(self.features)
                }))
                print("Create table tableDeviceInfo successfully.")
            } else {
                print("Create table tableDeviceInfo failed.")
            }
        } catch {
            let nserror = error as NSError
            print("Create table tableDeviceInfo failed. Error: \(nserror), \(nserror.userInfo)")
        }
    }
    
    func insert(name: String, resolution: String, announced: String, features: String?) -> Int64? {
        do {
            let insert = tableDeviceInfo.insert(self.name <- name, self.resolution <- resolution, self.announced <- announced, self.features <- features!)
            let insertedId = try DataBase.shared.connection?.run(insert)
            return insertedId
        } catch {
            let nserror = error as NSError
            print("Cannot insert new Device. Error: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func delete(id: Int64) {
        let device = tableDeviceInfo.filter(id == rowid)
        
        do {
            try? DataBase.shared.connection?.run(device.delete())
        }
        catch {
            let nserror = error as NSError
            print("Cannot insert new Device. Error: \(nserror), \(nserror.userInfo)")
        }
        // DELETE FROM "users" WHERE ("id" = 1)
    }
    
    func filter() -> AnySequence<Row>? {
        do {
            //SELECT * FROM "tableDeviceInfo" WHERE ("id" = 1)
            let filterCondition = (id == 1)
            
            return try DataBase.shared.connection?.prepare(self.tableDeviceInfo.filter(filterCondition))
        } catch {
            let nserror = error as NSError
            print("Cannot filter in tableDeviceInfo. Error: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    //UPDATE tableDeviceInfo SET(name= ... and resolution = ... and announced = ... and features = ...) WHERE id == ??
    func update(id: Int64, name: String?,resolution:String?,announced:String?,features:String?) -> Bool {
        if DataBase.shared.connection == nil {
            return false
        }
        do {
            let tblFilterDevice = self.tableDeviceInfo.filter(self.id == id)
            var setters:[SQLite.Setter] = [SQLite.Setter]()
            if name != nil {
                setters.append(self.name <- name!)
            }
            if resolution != nil {
                setters.append(self.resolution <- resolution!)
            }
            if announced != nil {
                setters.append(self.announced <- announced!)
            }
            if features != nil {
                setters.append(self.features <- features!)
            }
            if setters.count == 0  {
                print("Nothing to update")
                return false
            }
            let update = tblFilterDevice.update(setters)
            if try DataBase.shared.connection!.run(update) <= 0 {
                //Update unsuccessful
                return false
            }
            return true
        } catch {
            let nserror = error as NSError
            print("Cannot update objects in tableDeviceInfo. Error is: \(nserror), \(nserror.userInfo)")
            return false
        }
    }
    
    func queryAll() -> AnySequence<Row>? {
        do {
            return try DataBase.shared.connection?.prepare(self.tableDeviceInfo)
        } catch {
            let nserror = error as NSError
            print("Cannot query all tableDeviceInfo. Error: \(nserror), \(nserror.userInfo)")
            return nil
        }
    }
    
    func toString(device: Row) {
        print("""
            Device details. id = \(device[self.id]),
            Name: \(device[self.name]),
            resolution: \(device[self.resolution]),
            announced: \(device[self.announced]),
            features: \(device[self.features])
            """)
    }
    func fillList(device: Row) {
        var data: [String: String]? = [:]
        data!["id"] = String(device[self.id])
        data!["DeviceName"] = device[self.name]
        data!["resolution"] = device[self.resolution]
        data!["announced"] = device[self.announced]
        data!["features_c"] = device[self.features]
        devicesList?.append(data!)
    }
}
