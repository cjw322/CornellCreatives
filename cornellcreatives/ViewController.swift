//
//  ViewController.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView:UICollectionView!
    var categoriesArray: [Category]!
    
    let photoCellReuseIdentifier = "photoCellReuseIdentifier"
    let padding: CGFloat = 10
    let headerHeight: CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cornell Creatives"
        view.backgroundColor = .white
        
        let photographer = Category(imageName: "photographer")
        let videographer = Category(imageName: "videographer")
        let artist = Category(imageName: "artist")
        let tutor = Category(imageName: "tutor")
        let programmer = Category(imageName: "programmer")
        let other = Category(imageName: "other")
        categoriesArray = [photographer, videographer, artist, tutor, programmer, other]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: photoCellReuseIdentifier)
        view.addSubview(collectionView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        let category = categoriesArray[indexPath.item]
        cell.configure(with: category)
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categoriesArray[indexPath.item]
        let listViewController = ListViewController()
        listViewController.delegate = category.imageName // the delegate being passed is the image name
        navigationController?.pushViewController(listViewController, animated: true)
        
        // get list of users with the skill that was clicked on
        // display that list in detail view controller
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - padding) / 2.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
}

