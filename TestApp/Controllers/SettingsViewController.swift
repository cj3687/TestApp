import UIKit

class SettingsViewController: UITableViewController {
    
    //@IBOutlet var afawf: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updatePhoneList(_ sender: Any) {
        
        let alert1 = UIAlertController(title: "Brand name", message: "Please input brand name", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            let textField = alert1.textFields![0] as UITextField
            
            guard textField.text != "" else { /* Handle nil case */ return }
            
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            self.present(alert, animated: true, completion: nil)
            
            
            
            let parameters: [String: String] = [
                "token" : "7aa8c24da8b0912b8d4284f84c8e5fa75b7ab9efc29bfec0",
                "device" : textField.text!,
                "limit" : "5"
            ]
            
            DataHelper.shared.getDataFromURL(urlString: "https://fonoapi.freshpixl.com/v1/getdevice", parameters: parameters, completion: { response in
                for device in response {
                    DeviceEntity.shared.insert(name: device["DeviceName"]!,
                                               resolution: device["resolution"] != nil ? device["resolution"]! : "",
                                               announced: device["announced"] != nil ? device["announced"]! : "",
                                               features: device["features_c"] != nil ? device["features_c"]! : "")
                }
                if let departmentQuery = DeviceEntity.shared.queryAll() {
                    for eachDepartment in departmentQuery {
                        //print(DeviceEntity.shared.toString(device: eachDepartment))
                        DeviceEntity.shared.fillList(device: eachDepartment)
                    }
                }
                self.dismiss(animated: false, completion: nil)
                
                
            }, failureCompletion: { error in })
        }
        
        
        alert1.addTextField { (textField) in
            textField.placeholder = "Enter brand name"
        }
        alert1.addAction(action)
        present(alert1, animated:true, completion: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
