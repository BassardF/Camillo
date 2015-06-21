import UIKit
import CoreData

class DisplayPegViewController: UIViewController {
    
    var peg : NSManagedObject!
    
    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        key.text = peg.valueForKey("key") as? String
        name.text = peg.valueForKey("name") as? String
        
        var data = peg.valueForKey("image") as? NSData
        image.image =  UIImage(data: data!)
    }
    
}