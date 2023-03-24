//
//  AddBookViewController.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 11.03.2023.
//

import UIKit

class AddBookViewController: UIViewController {
    
private var addBookVM = AddBookViewModel()
    // textfield - name
    // textfield - autthorName
    // releasDate - picker
    // Rating - ...
    // genre - picker
    
    
    let titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter title"
        textfield.borderStyle = .roundedRect
        textfield.textColor = .black
        return textfield
    }()
    
    let authorNameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Author's name"
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
    
    
    
    
    
    
//    struct AddMovieScreen: View {
//
//        @StateObject private var addMovieVM = AddMovieViewModel()
//        @Environment(\.presentationMode) var presentationMode
//
//        var body: some View {
//            Form {
//                TextField("Enter name", text: $addMovieVM.title)
//                TextField("Enter director", text: $addMovieVM.director)
//                HStack {
//                    Text("Rating")
//                    Spacer()
//                    RatingView(rating: $addMovieVM.rating)
//                }
//                DatePicker("Release Date", selection: $addMovieVM.releaseDate)
//
//                HStack {
//                    Spacer()
//                    Button("Save") {
//                        addMovieVM.save()
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                    Spacer()
//                }
//
//            }
//            .navigationTitle("Add Movie")
//            .embedInNavigationView()
//        }
//    }
//
//    struct AddMovieScreen_Previews: PreviewProvider {
//        static var previews: some View {
//            AddMovieScreen()
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        
        view.addSubview(titleTextField)
        titleTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(110)
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(authorNameTextField)
        authorNameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(110)
            make.top.equalToSuperview().offset(230)
            make.width.equalTo(200)
            make.height.equalTo(40)
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
        addBookVM.save()
        
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
