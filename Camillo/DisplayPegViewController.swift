import UIKit
import CoreData

class DisplayPegViewController: UIViewController {
    
    var peg : NSManagedObject!
    
    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.hidden = true
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            view.addSubview(blurEffectView)
            
            blurEffectView.setTranslatesAutoresizingMaskIntoConstraints(false)
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
            view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
            
            let vibrancyView: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect))
            vibrancyView.setTranslatesAutoresizingMaskIntoConstraints(false)
            blurEffectView.contentView.addSubview(vibrancyView)
            
            var label: UILabel = UILabel()
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.text = "Vibrancy"
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
            label.textAlignment = .Center
            label.textColor = UIColor.whiteColor()
            vibrancyView.contentView.addSubview(label)
        }
        
        key.text = peg.valueForKey("key") as? String
        name.text = peg.valueForKey("name") as? String
        
        var data = peg.valueForKey("image") as? NSData
        image.image =  UIImage(data: data!)
    }
    
    
}