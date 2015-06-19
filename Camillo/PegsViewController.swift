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
        pegs = PegServices.getPegs(theater!)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "newPeg"){
            let pegsVC = segue.destinationViewController as! NewPegViewController
            pegsVC.theater = theater
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pegs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pegCell", forIndexPath: indexPath) as! UITableViewCell
        let peg = pegs[indexPath.row] as NSManagedObject
        cell.textLabel?.text = peg.valueForKey("key") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
