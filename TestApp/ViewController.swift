import UIKit
import SQLite3
import SwipeableTabBarController

class ViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let department1Id = DeviceEntity.shared.insert(name: "Financial information department",
                                                       resolution: "An example address 1",
                                                       announced: "New York",
                                                       features: "1111")
        let department2Id = DeviceEntity.shared.insert(name: "Department of Leadership",
                                                       resolution: "An example address 2",
                                                       announced: "California",
                                                       features: "2222")
        let department3Id = DeviceEntity.shared.insert(name: "Sales Department",
                                                       resolution: "An example address 3",
                                                       announced: "Pennsylvania",
                                                       features: "3333")
        let department4Id = DeviceEntity.shared.insert(name: "Investor News Department",
                                                       resolution: "An example address 4",
                                                       announced: "Florida",
                                                       features: "4444")
        let department5Id = DeviceEntity.shared.insert(name: "Department of Education and Researching ",
                                                       resolution: "An example address 5",
                                                       announced: "Indiana",
                                                       features: "5555")
//        let employEee2Id = EmployeeEntity.shared.insert(name: "Ponda Baba ",
//                                                        hireDate: Date(),
//                                                        identifier: "A0002",
//                                                        isManager: false,
//                                                        title: "This is a member",
//                                                        departmentId: department1Id)
        
//        if let departmentQuery = DeviceEntity.shared.queryAll() {
//            for eachDepartment in departmentQuery {
//                DeviceEntity.shared.toString(department: eachDepartment)
//            }
//        }
//        if let employeeQuery = EmployeeEntity.shared.queryAll() {
//            for eachEmployee in employeeQuery {
//                EmployeeEntity.shared.toString(employee: eachEmployee)
//            }
//        }
        
        print("Before update...")
        if let departmentQuery = DeviceEntity.shared.filter() {
            for eachDepartment in departmentQuery {
                print(DeviceEntity.shared.toString(device: eachDepartment))
                
            }
        }
        print("Begin update...")
        if DeviceEntity.shared.update(id: 1,
                                          name: nil,
                                          resolution: "new address999",
                                          announced: "a new City999",
                                          features: "9999") {
            print("Update successful")
        } else {
            print("Update unsuccessful")
        }
        print("After update...")
        if let departmentQuery = DeviceEntity.shared.filter() {
            for eachDepartment in departmentQuery {
                print(DeviceEntity.shared.toString(device: eachDepartment))
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
