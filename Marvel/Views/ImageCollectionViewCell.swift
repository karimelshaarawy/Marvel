//
//  ImageCollectionViewCell.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 13/01/2024.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    static let nib = UINib(nibName: identifier, bundle: nil)
    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var model:  Collection?
    func setupCellFromModel(model:Collection?) {
        // Initialization code
        if let model = model{
            comicName.text = model.title
            let url = URL(string: (model.thumbnail?.path ?? "") + ".jpg")
            imageView.kf.setImage(with: url)
        }}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    

}
