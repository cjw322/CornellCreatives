//
//  DetailViewController.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/29/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit
//
//protocol ViewControllerDelegate: class{
//    var person: Person {get}
//}

class DetailViewController: UIViewController {
    
    var person: Person!
    var indexPath: IndexPath!
//    var ViewControllerDelegate: ViewControllerDelegate!
    
    var profileImage: UIImage!
    var nameLabel: UILabel!
    var skillLabel: UILabel!
    
//    var delegate: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name: \(person.name)"
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        skillLabel = UILabel()
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        skillLabel.text = "Skill: \(person.skill)"
        skillLabel.textColor = .black
        view.addSubview(skillLabel)
        
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        NSLayoutConstraint.activate([
            skillLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            skillLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            skillLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
