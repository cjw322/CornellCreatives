//
//  PhotoCollectionViewCell.swift
//  cornellcreatives
//
//  Created by Katherine Go on 11/26/18.
//  Copyright © 2018 Katherine Go. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        contentView.addSubview(photoImageView)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        super.updateConstraints()
    }
    
    func configure(with category: Category){
        photoImageView.image = UIImage(named: category.imageName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
