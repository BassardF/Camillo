import UIKit

class NewTheaterViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    var key = "string"
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var stringButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.attributedPlaceholder = NSAttributedString(string:"Name", attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        stringButton.setTitleColor(UIColor(red: 127/255, green: 0, blue: 127/255, alpha: 1.0) , forState: UIControlState.Normal)
        numberButton.setTitleColor(UIColor.lightGrayColor() , forState: UIControlState.Normal)
        key = "string"
        name.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func create(sender: UIButton) {
        TheaterServices.newTheater(key, name: name.text!)
        navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func stringClick(sender: UIButton) {
        stringButton.setTitleColor(UIColor(red: 127/255, green: 0, blue: 127/255, alpha: 1.0) , forState: UIControlState.Normal)
        numberButton.setTitleColor(UIColor.lightGrayColor() , forState: UIControlState.Normal)
        key = "string"
    }
    
    @IBAction func numberClick(sender: UIButton) {
        numberButton.setTitleColor(UIColor(red: 127/255, green: 0, blue: 127/255, alpha: 1.0) , forState: UIControlState.Normal)
        stringButton.setTitleColor(UIColor.lightGrayColor() , forState: UIControlState.Normal)
        key = "number"
    }
    
    @IBAction func doneEnteringName(sender: AnyObject) {
        TheaterServices.newTheater(key, name: name.text!)
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
