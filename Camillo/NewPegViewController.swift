import UIKit
import CoreData
import MobileCoreServices

class NewPegViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var theater : NSManagedObject?
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var name: UITextField!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var keyValue = theater!.valueForKey("key") as! String
        if(keyValue == "number"){
            self.key.keyboardType = UIKeyboardType.NumbersAndPunctuation
        }
        
        key.attributedPlaceholder = NSAttributedString(string:"Key", attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        name.attributedPlaceholder = NSAttributedString(string:"Name", attributes:[NSForegroundColorAttributeName: UIColor.lightGrayColor()])
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
        name.becomeFirstResponder()
    }
    
    @IBAction func picturePicker(sender: UIButton) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if(mediaType.isEqualToString(kUTTypeImage as! String)) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            var imageData = UIImagePNGRepresentation(image)
            PegServices.newPeg(theater!, key: key.text, name: name.text, image: imageData)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        navigationController?.popViewControllerAnimated(true)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func exitFirst(sender: AnyObject) {
        key.becomeFirstResponder()
    }
    
    
    @IBAction func exitSecond(sender: AnyObject) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
}