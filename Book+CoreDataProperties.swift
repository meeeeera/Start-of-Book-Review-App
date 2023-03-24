//
//  Book+CoreDataProperties.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 16.03.2023.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var bookGenre: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var reviews: NSSet?

}

// MARK: Generated accessors for reviews
extension Book {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension Book : Identifiable {

}
