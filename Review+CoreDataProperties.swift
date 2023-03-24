//
//  Review+CoreDataProperties.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 16.03.2023.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var publishedAt: Date?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var book: Book?

}

extension Review : Identifiable {

}
