import UIKit
import CoreData

class PegsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var theater : NSManagedObject?
    var pegs : [NSManagedObject] = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.hidden = false
        self.title = theater!.valueForKey("name") as? String
        pegs = PegServices.getPegs(theater!)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "newPeg"){
            let pegsVC = segue.destinationViewController as! NewPegViewController
            pegsVC.theater = theater
        } else if(segue.identifier == "exploreSegue"){
            let pegsVC = segue.destinationViewController as! ExplorePegsPageViewController
            pegsVC.theater = theater!
            pegsVC.pegs = pegs
            pegsVC.current = 0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pegs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pegCell", forIndexPath: indexPath) as! UITableViewCell
        let peg = pegs[indexPath.row] as NSManagedObject
        cell.textLabel?.text = peg.valueForKey("key") as? String
        cell.detailTextLabel!.text = theater!.valueForKey("name") as? String        
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}