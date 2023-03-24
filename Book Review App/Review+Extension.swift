//
//  Review+Extension.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 16.03.2023.
//

import Foundation
import CoreData

extension Review: BaseModel {
    
    static func getReviewsByBookId(bookId: NSManagedObjectID) -> [Review] {
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "book = %@", bookId)
        
        do {
            return try CoreDataManager.shared.persistentContainer.viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
