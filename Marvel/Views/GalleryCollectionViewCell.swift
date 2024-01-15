//
//  GalleryCollectionViewCell.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 15/01/2024.
//

import UIKit
import Kingfisher
class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GalleryCollectionViewCell"
    
    static let nib = UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
    

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupFromModel(model:Collection, num: String){
    
        let url = URL(string:  (model.thumbnail?.path ?? "" ) + ".jpg")
        imageView.kf.setImage(with: url)
        titleLabel.text = model.title
        numLabel.text = num
        
    }
    

}
