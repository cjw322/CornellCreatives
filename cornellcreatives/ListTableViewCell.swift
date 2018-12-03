//
//  ListTableViewCell.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    var idLabel: UILabel!
    var nameLabel: UILabel!
    var skillLabel: UILabel!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 20
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 22)
        nameLabel.textColor = .black
        
        skillLabel = UILabel()
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.font = UIFont.boldSystemFont(ofSize: 20)
        skillLabel.textColor = .gray
        skillLabel.text = ""
        
        idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.font = UIFont.boldSystemFont(ofSize: 20)
        idLabel.textColor = .gray
        
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(skillLabel)
        contentView.addSubview(idLabel)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            skillLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: skillLabel.bottomAnchor, constant: padding),
            idLabel.heightAnchor.constraint(equalTo: skillLabel.heightAnchor)
            ])
        super.updateConstraints()
    }
    
    func configure(for people: Person) {
        idLabel.text = people.id
        nameLabel.text = people.name
//        skillLabel.text += people.skill
        let skillString = people.skill.description
        skillLabel.text = skillString
//        if let skillText = skillLabel.text {
//            skillLabel.text = "\(skillText)\(skillString)"
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
