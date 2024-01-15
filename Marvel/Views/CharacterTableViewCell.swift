//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 12/01/2024.
//

import UIKit
import Kingfisher
class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var charachterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    var imageUrl: String?
    static let identifier = "CharacterTableViewCell"
    static var nib : UINib{
        return UINib(nibName: identifier , bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        if let imageUrl = imageUrl {
//            charachterImage.kf.setImage(with: URL(string: imageUrl))
//        }
        
    }
    func fetchDataFromViewModel(model: Character){
        let url = URL(string: (model.thumbnail?.path ?? "") + "." + (model.thumbnail?.thumbnailExtension ?? ""))
        charachterImage.kf.setImage(with: url)
        characterName.text = model.name
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
