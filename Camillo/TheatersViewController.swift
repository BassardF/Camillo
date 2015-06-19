import UIKit
import CoreData

class TheaterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var theaters : [NSManagedObject] = [NSManagedObject]()
    var selectedRow = 0
    @IBOutlet weak var tableView: UITableView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        theaters = TheaterServices.getTheaters()
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theaters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let theater = theaters[indexPath.row] as NSManagedObject
        cell.textLabel?.text = theater.valueForKey("name") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath.row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showPegs"){
            let pegsVC = segue.destinationViewController as! PegsViewController
            pegsVC.theater = theaters[selectedRow]
        }
    }

}

