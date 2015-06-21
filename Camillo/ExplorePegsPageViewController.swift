import UIKit
import CoreData

class ExplorePegsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    let displayUnit : String = "pageView"
    var theater : NSManagedObject?
    var pegs : [NSManagedObject] = [NSManagedObject]()
    var current = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        let ctrl = self.getViewController()
        ctrl.peg = pegs[current]
        let ctrls: NSArray = [ctrl]
        self.setViewControllers(ctrls as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{

        if(current > 0){
            current =  current - 1;
            var ctrl = self.getViewController()
            ctrl.peg = pegs[current]
            return ctrl
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        
        if(current < pegs.count - 1){
            current = current + 1;
            var ctrl = self.getViewController()
            ctrl.peg = pegs[current]
            return ctrl
        } else {
            return nil
        }
        
    }
    
    func getViewController() -> DisplayPegViewController! {
        return self.storyboard!.instantiateViewControllerWithIdentifier(displayUnit) as! DisplayPegViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.current
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
