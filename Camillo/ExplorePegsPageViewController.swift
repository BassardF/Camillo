import UIKit
import CoreData

class ExplorePegsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let displayUnit : String = "pageView"
    var theater : NSManagedObject?
    var pegs : [NSManagedObject] = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        let ctrl = self.getViewController()
        ctrl.peg = pegs[0]
        ctrl.index = 0
        var key = pegs[0].valueForKey("key") as! String
        var name = pegs[0].valueForKey("name") as! String
        self.title = "\(key) : \(name)"
        let ctrls: NSArray = [ctrl]
        self.setViewControllers(ctrls as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        var oldCtrl = viewController as! DisplayPegViewController
        var current = oldCtrl.index
        if(current > 0){
            current =  current - 1;
            var ctrl = self.getViewController()
            ctrl.peg = pegs[current]
            ctrl.index = current
            var key = pegs[current].valueForKey("key") as! String
            var name = pegs[current].valueForKey("name") as! String
            self.title = "\(key) : \(name)"
            return ctrl
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        var oldCtrl = viewController as! DisplayPegViewController
        var current = oldCtrl.index
        if(current < pegs.count - 1){
            current = current + 1;
            var ctrl = self.getViewController()
            ctrl.peg = pegs[current]
            ctrl.index = current
            var key = pegs[current].valueForKey("key") as! String
            var name = pegs[current].valueForKey("name") as! String
            self.title = "\(key) : \(name)"
            return ctrl
        } else {
            return nil
        }
        
    }
    
    func getViewController() -> DisplayPegViewController! {
        return self.storyboard!.instantiateViewControllerWithIdentifier(displayUnit) as! DisplayPegViewController
    }
}
