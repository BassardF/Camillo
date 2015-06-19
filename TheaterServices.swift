import UIKit
import CoreData

class TheaterServices: NSObject {
    
    static func newTheater(key : String, name: String) {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Theater", inManagedObjectContext: managedContext)
        
        let theater = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        theater.setValue(name, forKey: "name")
        theater.setValue(key, forKey: "key")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    static func getTheaters() -> [NSManagedObject]{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Theater")
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            return results
        } else {
            return [];
        }
    }
}