//
//  ListTableViewCell.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var skillLabel: UILabel!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 26
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        nameLabel.textColor = .black
        
        skillLabel = UILabel()
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.font = UIFont.systemFont(ofSize: 22)
        // skillLabel.font = UIFont.boldSystemFont(ofSize: 20)
        skillLabel.textColor = .gray
        skillLabel.text = ""

        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(skillLabel)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            skillLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            skillLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        super.updateConstraints()
    }
    
    func configure(for people: Person) {
        nameLabel.text = people.name
        let skillString = "Skills: \(people.services.joined(separator: ", "))"
        skillLabel.text = skillString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
