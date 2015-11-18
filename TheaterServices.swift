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
        
        do {
            try managedContext.save()
        } catch _{
            print("Saving issue")
        }
    }
    
    static func getTheaters() -> [NSManagedObject]{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Theater")
        
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                return results
            } else {
                return [];
            }
        } catch _{
            print("Saving issue")
            return [];
        }
        
    }
    
    static func deleteTheater(theater : NSManagedObject){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        // Delete pegs
        let fetchRequest = NSFetchRequest(entityName:"Peg")
        let predicate = NSPredicate(format: "theater = %@", theater)
        fetchRequest.predicate = predicate
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                for res in results {
                    PegServices.deletePeg(res)
                }
            }
        } catch _{
            print("Failed : fetching results")
        }
        // Delete theater
        managedContext.deleteObject(theater)
        do {
            try managedContext.save()
        } catch {
            print("Deleting issue")
        }

    }
}