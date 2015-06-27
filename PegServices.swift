import UIKit
import CoreData

class PegServices: NSObject {
    
    static func getPegs(theater : NSManagedObject) -> [NSManagedObject]{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Peg")
        let predicate = NSPredicate(format: "theater = %@", theater)
        fetchRequest.predicate = predicate
        
        var error: NSError?
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            return results
        } else {
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
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
    }
    
    static func count() -> Int{
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName:"Peg")
        
        var error: NSError?
        
        var count = managedContext.countForFetchRequest(fetchRequest, error: &error)
        
        if(error == nil){
            return count
        }
        
        return 0
    }
    
    static func deletePeg(peg : NSManagedObject){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        managedContext.deleteObject(peg)
        managedContext.save(nil)
    }
}