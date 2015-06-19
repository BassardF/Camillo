import UIKit

class NewTheaterViewController: UIViewController {

    @IBOutlet weak var key: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func create(sender: UIButton) {
        TheaterServices.newTheater(key.text, name: name.text)
    }

}
