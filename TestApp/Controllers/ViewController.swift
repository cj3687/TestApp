import UIKit
import SQLite3
import SwipeableTabBarController

class ViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let departmentQuery = DeviceEntity.shared.queryAll() {
            for eachDepartment in departmentQuery {
                //print(DeviceEntity.shared.toString(device: eachDepartment))
                DeviceEntity.shared.fillList(device: eachDepartment)
            }
        }
        
        selectedIndex = 1
        setSwipeAnimation(type: SwipeAnimationType.sideBySide)
        setTapAnimation(type: SwipeAnimationType.sideBySide)
        setDiagonalSwipe(enabled: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
