import UIKit
import CoreData

class DisplayPegViewController: UIViewController {
    
    var peg : NSManagedObject!
    var index : Int!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var data = peg.valueForKey("image") as? NSData
        image.image =  UIImage(data: data!)
    }
    
    
}