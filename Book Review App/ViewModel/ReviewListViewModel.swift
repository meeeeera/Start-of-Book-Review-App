//
//  ReviewListViewModel.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 16.03.2023.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    @Published var reviews = [BookViewModel]()
    
    //    func getReviewsByBook(vm: BookViewModel) {
    //        DispatchQueue.main.async {
    //            self.reviews = Review.getReviewsByBookId(bookId: vm.id).map(ReviewViewModel.init)
    //        }
    //    }
    
    
    struct ReviewViewModel {
        
        let review: Review
        
        var reviewId: NSManagedObjectID {
            return review.objectID
        }
        
        var title: String {
            return review.title ?? ""
        }
        
        var text: String {
            return review.text ?? ""
        }
        
        
    }
}
