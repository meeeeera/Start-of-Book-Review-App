//
//  BookListTableViewCell.swift
//  Book Review App
//
//  Created by Мира Зейнурова on 14.03.2023.
//

import UIKit

//nado raspolozhit' vse labels


class BookListTableViewCell: UITableViewCell {
    let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let authorName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    let rating: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.shadowColor = UIColor(red: 0.947, green: 0.964, blue: 0.979, alpha: 1)
        return label
    }()
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            self.addSubview(title)
            title.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(200)
            }
    
            self.addSubview(authorName)
            authorName.snp.makeConstraints { make in
                make.leading.centerY.equalToSuperview().offset(20)
            make.height.equalTo(25)
            make.width.equalTo(170)
            }

        }

}

