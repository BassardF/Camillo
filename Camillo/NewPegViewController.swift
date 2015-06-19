import UIKit
import CoreData
import MobileCoreServices

class NewPegViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var theater : NSManagedObject?
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var previewImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
    }
    
    @IBAction func picturePicker(sender: UIButton) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func create(sender: AnyObject) {
        var imageData = UIImagePNGRepresentation(previewImage.image)
        PegServices.newPeg(theater!, key: key.text, name: name.text, image: imageData)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        if(mediaType.isEqualToString(kUTTypeImage as! String)) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            previewImage.image = image
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}