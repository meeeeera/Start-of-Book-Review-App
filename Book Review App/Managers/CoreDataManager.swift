//
//  CoreDataManager.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 13.03.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init () {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Book_Review_App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    
    func getResultContainer(entityName: String, sortingKey: String) -> NSFetchedResultsController<NSFetchRequestResult> {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        let sortDiscriptor = NSSortDescriptor(key: sortingKey, ascending: true)
        request.sortDescriptors = [sortDiscriptor]
        
        let resultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        return resultController
    }
    
    func getEntity(name: String) -> NSEntityDescription {
        NSEntityDescription.entity(forEntityName: "Book", in: context)!
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror)")
            }
        }
    }
    
        func getBookById(id: NSManagedObjectID) -> Book? {
                do {
                    return try persistentContainer.viewContext.existingObject(with: id) as? Book
                } catch {
                    print(error)
                    return nil
                }
    
            }
    
    func createObject(title: String, authorName: String, rating: Double, releaseDate: Date, bookGenre: String) {
        let entity = getEntity(name: "Book")
        let managedObject = Book(entity: entity, insertInto: context)
        
        managedObject.title = title
        managedObject.authorName = authorName
        managedObject.rating = rating
        managedObject.releaseDate = releaseDate
        managedObject.bookGenre = bookGenre
        saveContext()
        
    }
    
//    func deleteAll() {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
//        do {
//            let results = try context.fetch(fetchRequest) as! [NSManagedObject]
//            for result in results{
//                context.delete(result)
//            }
//            saveContext()
//        } catch {
//            print(error)
//        }
//    }
    
//    func printAllObects() {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
//
//        do{
//            let results = try context.fetch(fetchRequest) as! [Book]
//            for result in results {
//                let title = result.title
//                let authorName = result.authorName
//                let rating = result.rating
//                let releaseDate = result.releaseDate
//                let bookGenre = result.bookGenre
//            }
//        } catch {
//            print(error)
//        }
//    }
    
    
    func deleteBook(_ book: Book) {
        
        persistentContainer.viewContext.delete(book)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete movie \(error)")
        }
        
    }
    
    func getAllBooks() -> [Book] {
        
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
}
