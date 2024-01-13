//
//  ImageCollectionViewCell.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 13/01/2024.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
