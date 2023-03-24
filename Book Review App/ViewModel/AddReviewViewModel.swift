//
//  AddReviewViewModel.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 13.03.2023.

import Foundation

class AddReviewViewModel: ObservableObject {
    var title: String = ""
    var text: String = ""
    
    func addReviewForBook(vm: BookViewModel ) {
        let book: Book? = Book.byId(id: vm.id)
        if let book = book {
            let review = Review(context: Review.viewContext)
                    review.title = title
                    review.text = text
                    review.book = book
            review.save()
        }
       
        
    }

}
