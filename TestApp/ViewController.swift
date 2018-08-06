import UIKit
import SQLite3
import SwipeableTabBarController

class ViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Before update...")
        if let departmentQuery = DeviceEntity.shared.filter() {
            for eachDepartment in departmentQuery {
                print(DeviceEntity.shared.toString(device: eachDepartment))
                
            }
        }
        selectedIndex = 0
        setSwipeAnimation(type: SwipeAnimationType.sideBySide)
        setTapAnimation(type: SwipeAnimationType.sideBySide)
        setDiagonalSwipe(enabled: false)
//        print("Begin update...")
//        if DeviceEntity.shared.update(id: 1,
//                                          name: nil,
//                                          resolution: "new address999",
//                                          announced: "a new City999",
//                                          features: "9999") {
//            print("Update successful")
//        } else {
//            print("Update unsuccessful")
//        }
//        print("After update...")
//        if let departmentQuery = DeviceEntity.shared.filter() {
//            for eachDepartment in departmentQuery {
//                print(DeviceEntity.shared.toString(device: eachDepartment))
//            }
//        }
        
        if let departmentQuery = DeviceEntity.shared.queryAll() {
            for eachDepartment in departmentQuery {
                print(DeviceEntity.shared.toString(device: eachDepartment))
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
