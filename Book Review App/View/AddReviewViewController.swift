//
//  AddReviewViewController.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 14.03.2023.
//

import UIKit

class AddReviewViewController: UIViewController {
    private var addReviewVM = AddReviewViewModel()

    
    let book = BookViewModel(book: Book(context: CoreDataManager.shared.persistentContainer.viewContext))
    
    let reviewTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter your review"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    let saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(reviewTextField)
        reviewTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(110)
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(200)
            make.height.equalTo(250)
        }
        
        view.addSubview(saveButton)
            saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
            saveButton.snp.makeConstraints { make in
                make.leading.equalTo(160)
                make.top.equalToSuperview().offset(300)
                make.width.equalTo(80)
                make.height.equalTo(28)
            }

    }
    

    @objc func save() {
        addReviewVM.addReviewForBook(vm: book)
        
//        if titleTextField.text?.isEmpty == true ||  ((authorNameTextField.text!.isEmpty) == true) {
//
//            let alert = UIAlertController(title: "Error", message: "Fill all fields", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
//            self.present(alert, animated: true)
//        } else {
//            guard let title = titleTextField.text else { return }
//            guard let authorName = authorNameTextField.text else { return }
//
//            CoreDataManager.createObject(title: title, authorName: authorName, rating: <#T##Double#>)
////            coreDataManager.createObject(name: name, deadline: date)
//
//            dismiss(animated: true)
//        }
    }
}
