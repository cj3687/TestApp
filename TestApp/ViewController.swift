import UIKit
import SQLite3
import SwipeableTabBarController

class ViewController: SwipeableTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let department1Id = DepartmentEntity.shared.insert(name: "Financial information department",
                                                           address: "An example address 1",
                                                           city: "New York",
                                                           zipCode: 1111)
        let department2Id = DepartmentEntity.shared.insert(name: "Department of Leadership",
                                                           address: "An example address 2",
                                                           city: "California",
                                                           zipCode: 2222)
        let department3Id = DepartmentEntity.shared.insert(name: "Sales Department",
                                                           address: "An example address 3",
                                                           city: "Pennsylvania",
                                                           zipCode: 3333)
        let department4Id = DepartmentEntity.shared.insert(name: "Investor News Department",
                                                           address: "An example address 4",
                                                           city: "Florida",
                                                           zipCode: 4444)
        let department5Id = DepartmentEntity.shared.insert(name: "Department of Education and Researching ",
                                                           address: "An example address 5",
                                                           city: "Indiana",
                                                           zipCode: 5555)
        let employEee1Id = EmployeeEntity.shared.insert(name: "Luke Skywalker",
                                                        hireDate: Date(),
                                                        identifier: "A0001",
                                                        isManager: true,
                                                        title: "This is a leader",
                                                        departmentId: department1Id)
//        let employEee2Id = EmployeeEntity.shared.insert(name: "Ponda Baba ",
//                                                        hireDate: Date(),
//                                                        identifier: "A0002",
//                                                        isManager: false,
//                                                        title: "This is a member",
//                                                        departmentId: department1Id)
        
//        if let departmentQuery = DepartmentEntity.shared.queryAll() {
//            for eachDepartment in departmentQuery {
//                DepartmentEntity.shared.toString(department: eachDepartment)
//            }
//        }
//        if let employeeQuery = EmployeeEntity.shared.queryAll() {
//            for eachEmployee in employeeQuery {
//                EmployeeEntity.shared.toString(employee: eachEmployee)
//            }
//        }
        let jsonString = DataHelper.shared.getDataFromURL(urlString2: "432432432")
        print("Before update...")
        if let departmentQuery = DepartmentEntity.shared.filter() {
            for eachDepartment in departmentQuery {
                print(DepartmentEntity.shared.toString(department: eachDepartment))
                
            }
        }
        print("Begin update...")
        if DepartmentEntity.shared.update(id: 1,
                                          name: nil,
                                          address: "new address999",
                                          city: "a new City999",
                                          zipCode: 9999) {
            print("Update successful")
        } else {
            print("Update unsuccessful")
        }
        print("After update...")
        if let departmentQuery = DepartmentEntity.shared.filter() {
            for eachDepartment in departmentQuery {
                print(DepartmentEntity.shared.toString(department: eachDepartment))
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
