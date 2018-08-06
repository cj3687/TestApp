import UIKit


class DevicesCustomTableView: UITableViewController {
    
    //our table view
    @IBOutlet weak var devicesTableView: UITableView!
    
    //a list to store heroes
    var devices = [Device]()
    
    //the method returning size of the list
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return devices.count
    }
    
    
    //the method returning each cell of the list
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeviceCustomCell
        
        //getting the hero for the specified position
        let device: Device
        device = devices[indexPath.row]
        
        //displaying values
        cell.labelName.text = device.name
        cell.labelTeam.text = device.id_companion
        
        
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
        
        
        //fetching data from web api
//        Alamofire.request(URL_GET_DATA).responseJSON { response in
//
//            //getting json
//            if let json = response.result.value {
//
//                //converting json to NSArray
//                let heroesArray : NSArray  = json as! NSArray
//
//                //traversing through all elements of the array
//                for i in 0..<heroesArray.count{
//
//                    //adding hero values to the hero list
//                    self.heroes.append(Hero(
//                        name: (heroesArray[i] as AnyObject).value(forKey: "name") as? String,
//                        team: (heroesArray[i] as AnyObject).value(forKey: "team") as? String,
//                        imageUrl: (heroesArray[i] as AnyObject).value(forKey: "imageurl") as? String
//                    ))
//
//                }
//
//                //displaying data in tableview
//                self.devicesTableView.reloadData()
//            }
//
//        }
        
        
        
        self.devicesTableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
