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
            /*
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50))
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
            */
            
            // Blur Effect
            var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            var blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRectMake(0 , 0, self.view.frame.width, 600)
            view.addSubview(blurEffectView)
            
            // Vibrancy Effect
            var vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
            var vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
            vibrancyEffectView.frame = view.bounds
            
            // Label for vibrant text
            var vibrantLabel = UILabel()
            vibrantLabel.text = "Vibrant"
            vibrantLabel.font = UIFont.systemFontOfSize(12.0)
            vibrantLabel.sizeToFit()
            vibrantLabel.center = view.center
            
            // Add label to the vibrancy view
            vibrancyEffectView.contentView.addSubview(vibrantLabel)
            
            // Add the vibrancy view to the blur view
            blurEffectView.contentView.addSubview(vibrancyEffectView)
  
            //view.addConstraint(NSLayoutConstraint(item: blurEffectView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50))
            
        }
        
        key.text = peg.valueForKey("key") as? String
        name.text = peg.valueForKey("name") as? String
        
        var data = peg.valueForKey("image") as? NSData
        image.image =  UIImage(data: data!)
    }
    
    
}