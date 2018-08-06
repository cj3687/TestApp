import UIKit

class DeviceCustomCell: UITableViewCell {
    
    @IBOutlet weak var devicePhoto: UIImageView!
    @IBOutlet weak var deviceTitle: UILabel!
    @IBOutlet weak var deviceDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
