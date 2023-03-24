//
//  ViewController.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 11.03.2023.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate {
  
    
  
    //add TableView that will store List of Books; authorName; Date; Rating
    var fetchresultController = NSFetchedResultsController<NSFetchRequestResult>()
    let coreDataManager = CoreDataManager.shared
    
    var bookListTable: UITableView = {
    var table = UITableView()
    return table
    }()
 
    var addButton: UIButton = {
    var button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        return button
        }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        fetchresultController = coreDataManager.getResultContainer(entityName: "Book_Review_App", sortingKey: "Book")
        
        do {
            try fetchresultController.performFetch()
        } catch {
            print(error)
        }
        
        fetchresultController.delegate = self
        
        bookListTable.register(BookListTableViewCell.self, forCellReuseIdentifier: "myCell")
        bookListTable.dataSource = self
        bookListTable.delegate = self
        
        view.addSubview(addButton)
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-14)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionInfo = fetchresultController.sections?[section] else {
            return 0
        }
        return sectionInfo.numberOfObjects
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = bookListTable.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as?
          BookListTableViewCell else { return UITableViewCell()}
           let item = fetchresultController.object(at: indexPath) as? Book
          cell.title.text = item?.title
          cell.authorName.text = item?.authorName
          
//          cell.deadlineLabel.text = item!.deadline
//           cell.actionLabel.text = item!.name
          
           return cell
      }
    
    
    @objc func addAction() {
        self.present(AddBookViewController(), animated: true)
    }

}
