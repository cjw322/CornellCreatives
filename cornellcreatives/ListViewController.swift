//
//  ListViewController.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people: [Person]!
    var tableView: UITableView!
    
    let reuseIdentifier = "skillsCellReuse"
    let cellHeight: CGFloat = 82
    
    var delegate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List of Artists"
        view.backgroundColor = .white
//        let person1 = Person(id: "ksg73", name: "Katie", skill: ["Photographer", "Tutor"])
//        let person2 = Person(id: "cjw322", name: "Cora", skill: ["Photographer", "Artist"])
//
//        people = [person1, person2]
        
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        setUpConstraints()
        updateSearchResults()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ListTableViewCell
        let person = people[indexPath.row]
        cell.configure(for: person)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.indexPath = indexPath
        //        detailViewController.delegate = person
        detailViewController.person = person
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let peopleArray = people {
            return peopleArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func updateSearchResults() {
        if let services = delegate {
            if !services.isEmpty {
                // TODO: Make a request to the Recipe Puppy API using a
                // title and then update the table view with the updated [Recipe]
                // that you get after you decode the response
                // Hint: The searchText is the title.
                if services == "photographer" {
                    NetworkManager.getPhotographers() { (photographers) in
                        self.people = photographers
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                else if services == "videographer"{
                    NetworkManager.getVideographers(){ (videographers) in
                        self.people = videographers
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                else if services == "artist"{
                    NetworkManager.getArtists(){ (artists) in
                        self.people = artists
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                else if services == "tutor"{
                    NetworkManager.getTutors(){ (tutors) in
                        self.people = tutors
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                else if services == "programmer"{
                    NetworkManager.getProgrammers(){ (programmers) in
                        self.people = programmers
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                else if services == "other"{
                    NetworkManager.getOthers(){ (other) in
                        self.people = other
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
                print("searched")
                print(self.people)
            }
            else {
                self.people = []
                self.tableView.reloadData()
            }
        }
    }
    
}
