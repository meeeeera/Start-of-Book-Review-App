//
//  AddBookViewModel.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 14.03.2023.
//

import Foundation

class AddBookViewModel: ObservableObject {
    
    var title: String = ""
    var authorName: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
    var bookGenre: String = ""
    
    func save() {
        let book = Book(context: Book.viewContext)
        book.title = title
        book.authorName = authorName
        book.bookGenre = bookGenre
        book.rating = Double(rating ?? 0)
        book.releaseDate = releaseDate
        
        book.save()
    }
    
}
