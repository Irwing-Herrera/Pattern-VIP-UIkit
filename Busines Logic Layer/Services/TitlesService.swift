//
//  TitlesService.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import CoreData

protocol TitlesService: AnyObject {
    func getTitles() throws -> [Title]
    func getTitle(with id: String) throws -> Title?
    func addTitle(text: String) throws -> Title
    func deleteTitle(with id: String) throws
}


class TitlesServiceImplementation: TitlesService {
    
    let persistentContainer = PersistentContainerProvider.getInstance()
    lazy var managedContext: NSManagedObjectContext = { persistentContainer.viewContext }()
    
    func getTitles() throws -> [Title] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let titles = result as? [Title] {
                return titles
            } else {
                return []
            }
        } catch {
            print("No se pueden conseguir títulos")
            return []
        }
    }
    
    func addTitle(text: String) throws -> Title {
        let title = NSEntityDescription.insertNewObject(
            forEntityName: "Title",
            into: managedContext
        ) as! Title
        
        title.text = text
        title.id = UUID().uuidString
        
        do {
            try managedContext.save()
        } catch {
            print("No se puede añadir un título")
        }
        
        return title
    }
    
    func deleteTitle(with id: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let objectToDelete = result.first as? NSManagedObject {
                managedContext.delete(objectToDelete)
                
                do {
                    try managedContext.save()
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func getTitle(with id: String) throws -> Title? {
        let predicate = NSPredicate(format: "id = %@", id)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let title = result.first as? Title  {
                return title
            }
        } catch {
            print("No se pudo conseguir el título")
        }
        
        return nil
    }
}
