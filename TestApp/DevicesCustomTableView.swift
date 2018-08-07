import UIKit


class DevicesCustomTableView: UITableViewController {
    
    //our table view
    @IBOutlet weak var devicesTableView: UITableView!
    
    //the method returning size of the list
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (DeviceEntity.shared.devicesList!.count - 1)
    }
    
    
    //the method returning each cell of the list
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellDevice", for: indexPath) as! DeviceCustomCell
        
        //getting the hero for the specified position
        let device = DeviceEntity.shared.devicesList![indexPath.row + 1]
        
        //displaying values
        cell.deviceTitle.text = device["DeviceName"]
        cell.deviceDescription.text = device["features_c"]
        
        
//        //displaying image
//        Alamofire.request(hero.imageUrl!).responseImage { response in
//            debugPrint(response)
//
//            if let image = response.result.value {
//                cell.heroImage.image = image
//            }
//        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "customDeviceCell", bundle: nil), forCellReuseIdentifier: "customCellDevice")
        
    }
    
    func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                
                // your code here, get the row for the indexPath or do whatever you want
            }
        }
    }
    
    @IBAction func handleGesture(_ sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began
        {
            let deleteAlert = UIAlertController(title: "Delete", message: "All data will be lost.", preferredStyle: UIAlertControllerStyle.alert)
            
            deleteAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                print("Handle Ok logic here")
                //let touchPoint = longPressGestureRecognizer.location(in: self.view)
                //if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                //    DeviceEntity.shared.delete(id: Int64(DeviceEntity.shared.devicesList![indexPath.row + 1]["id"]!)!)
                //}
                
            }))
            
            deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
            
            present(deleteAlert, animated: true, completion: nil)
        }
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.devicesTableView.reloadData()
        // reload at this point
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
