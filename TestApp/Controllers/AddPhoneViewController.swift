import UIKit

class AddPhoneViewController: UITableViewController, UITextFieldDelegate {
    
    //@IBOutlet var afawf: UITableViewCell!
    
    @IBOutlet var deviceName: UITextField!
    @IBOutlet var resolution: UITextField!
    @IBOutlet var announced: UITextField!
    @IBOutlet var features_c: UITextField!
    @IBOutlet var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceName.delegate = self
        resolution.delegate = self
        announced.delegate = self
        features_c.delegate = self
    }
    
    @IBAction func addNewElement(_ sender: Any) {
        
        if deviceName.text == "" || resolution.text == ""
        || announced.text == "" || features_c.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please fill all the fields to continue", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                return;
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        DeviceEntity.shared.insert(name: deviceName.text!,
                                       resolution: resolution.text!,
                                       announced: announced.text!,
                                       features: features_c.text)
        if let departmentQuery = DeviceEntity.shared.queryAll() {
            for eachDepartment in departmentQuery {
                //print(DeviceEntity.shared.toString(device: eachDepartment))
                DeviceEntity.shared.fillList(device: eachDepartment)
            }
        }
        
        let alertController = UIAlertController(title: "Success", message: "New item added successfully", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.deviceName.text = ""
            self.resolution.text = ""
            self.announced.text = ""
            self.features_c.text = ""
            return;
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
