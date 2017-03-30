//
//  listVCell.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit

class listVCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoAvaImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var activityIndAva: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        self.photoAvaImage.image = UIImage(named: "IconGirl")
        //print("prepareForReuse")
    }
}
