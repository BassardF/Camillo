import UIKit
import CoreData

class TheaterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var theaters : [NSManagedObject] = [NSManagedObject]()
    var selectedRow = 0
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var theaterCount: UILabel!
    @IBOutlet weak var pegCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        theaters = TheaterServices.getTheaters()
        theaterCount.text = String(theaters.count)
        pegCount.text = String(PegServices.count())
        tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theaters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let theater = theaters[indexPath.row] as NSManagedObject
        cell.textLabel?.text = theater.valueForKey("name") as? String
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.text = theater.valueForKey("key") as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath.row
        performSegueWithIdentifier("showPegs", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "showPegs"){
            let pegsVC = segue.destinationViewController as! PegsViewController
            pegsVC.theater = theaters[selectedRow]
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let tmp = theaters[indexPath.row]
            theaters.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            TheaterServices.deleteTheater(tmp)
        }
    }

}

