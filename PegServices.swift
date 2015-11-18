import UIKit
import CoreData

class PegServices: NSObject {
    
    static func getPegs(theater : NSManagedObject) -> [NSManagedObject]{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Peg")
        let predicate = NSPredicate(format: "theater = %@", theater)
        fetchRequest.predicate = predicate
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                return results
            } else {
                return [];
            }
        } catch _{
            print("Failed : fetching results")
            return [];
        }
    }
    
    static func newPeg(theater : NSManagedObject, key : String, name : String, image : NSData){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity = NSEntityDescription.entityForName("Peg", inManagedObjectContext: managedContext)
        
        let peg = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        
        peg.setValue(name, forKey: "name")
        peg.setValue(key, forKey: "key")
        peg.setValue(image, forKey: "image")
        peg.setValue(theater, forKey: "theater")
        
        do {
            try managedContext.save()
        } catch {
            print("Could not save")
        }
    }
    
    static func count() -> Int{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Peg")
        
        var error: NSError?
        
        let count = managedContext.countForFetchRequest(fetchRequest, error: &error)
        
        if(error == nil){
            return count
        }
        
        return 0
    }
    
    static func deletePeg(peg : NSManagedObject){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        managedContext.deleteObject(peg)
        do {
            try managedContext.save()
        } catch _{
            print("Could not delete peg")
        }

    }
}