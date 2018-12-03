//
//  DetailViewController.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/29/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person!
    var indexPath: IndexPath!

    var profileImage: UIImageView!
    var nameLabel: UILabel!
    var skillLabel: UILabel!
    var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = person.name
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        view.addSubview(nameLabel)
        
        skillLabel = UILabel()
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.text = "Skills: \(person.services.joined(separator: ", "))"
        skillLabel.textColor = .black
        skillLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(skillLabel)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email: \(person.netid)@cornell.edu"
        emailLabel.textColor = .black
        emailLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(emailLabel)
        
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        if person.name == "Dani Zeller" {
            profileImage.image = UIImage(named: "dani")
        }
        else if person.name == "Yuet Ming Leung" {
            profileImage.image = UIImage(named: "attilus")
        }
        else if person.name == "Jia Junn Ang" {
            profileImage.image = UIImage(named: "jj")
        }
        else {
            profileImage.image = UIImage(named: "profile")
        }
        profileImage.contentMode = .scaleAspectFit
        view.addSubview(profileImage)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 350),
            profileImage.widthAnchor.constraint(equalToConstant: 350)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 48)
            ])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            skillLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skillLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: skillLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
}
