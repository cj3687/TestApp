import UIKit

class SettingsViewController: UITableViewController {
    
    //@IBOutlet var afawf: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updatePhoneList(_ sender: Any) {
        let parameters: [String: String] = [
            "token" : "7aa8c24da8b0912b8d4284f84c8e5fa75b7ab9efc29bfec0",
            "device" : "Honor",
            "limit" : "5"
        ]
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        DataHelper.shared.getDataFromURL(urlString: "https://fonoapi.freshpixl.com/v1/getdevice", parameters: parameters, completion: { response in
            for device in response {
                DeviceEntity.shared.insert(name: device["DeviceName"]!,
                                           resolution: device["resolution"]!,
                                           announced: device["announced"]!,
                                           features: device["features_c"])
            }
            self.dismiss(animated: false, completion: nil)
            
            
        }, failureCompletion: { error in })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
