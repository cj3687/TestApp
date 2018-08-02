import Foundation
import SQLite

class DataBase {
    static let shared = DataBase()
    public let connection: Connection?
    public let databaseFileName = "sqliteExample.sqlite3"
    private init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as String?
        do {
            connection = try Connection("\(dbPath!)/(databaseFileName)")
        } catch {
            connection = nil
            let nserror = error as NSError
            print("Cannot connect to Database. Error: \(nserror), \(nserror.userInfo)")
        }
    }
}
