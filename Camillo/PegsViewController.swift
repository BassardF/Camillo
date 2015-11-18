import UIKit
import CoreData

class PegsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var theater : NSManagedObject?
    var pegs : [NSManagedObject] = [NSManagedObject]()
    @IBOutlet weak var tableView: UITableView!
    var selected = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController!.navigationBar.hidden = false
        let title = theater!.valueForKey("name") as! String
        self.title = "\(title)'s pegs"
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
            pegsVC.index = selected
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pegs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pegCell", forIndexPath: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let peg = pegs[indexPath.row] as NSManagedObject
        cell.textLabel?.text = peg.valueForKey("key") as? String
        cell.detailTextLabel!.text = peg.valueForKey("name") as? String
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selected = indexPath.row
        performSegueWithIdentifier("exploreSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let tmp = pegs[indexPath.row]
            pegs.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            PegServices.deletePeg(tmp)
        }
    }
}