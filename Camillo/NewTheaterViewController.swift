import UIKit

class NewTheaterViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    var key = "string"
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var stringButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Theater"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func create(sender: UIButton) {
        TheaterServices.newTheater(key, name: name.text)
        navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func stringClick(sender: UIButton) {
        numberButton.setImage(UIImage(named: "number"), forState: UIControlState.Normal)
        stringButton.setImage(UIImage(named: "string-s"), forState: UIControlState.Normal)
        key = "string"
    }
    
    @IBAction func numberClick(sender: UIButton) {
        numberButton.setImage(UIImage(named: "number-s"), forState: UIControlState.Normal)
        stringButton.setImage(UIImage(named: "string"), forState: UIControlState.Normal)
        key = "number"
    }
    
}
