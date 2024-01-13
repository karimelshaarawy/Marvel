//
//  CharacterViewController.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 12/01/2024.
//

import UIKit
import Kingfisher

class CharacterViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var collectionsTableView: UITableView!
    
    var character: Character?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFromModel()
        collectionsTableView.delegate = self
        collectionsTableView.dataSource = self
        collectionsTableView.register(CollectionTableViewCell.nib, forCellReuseIdentifier:  CollectionTableViewCell.identifier)
        collectionsTableView.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }
    
    func setupViewFromModel(){
        if let character = character{
            let path = character.thumbnail!.path! + ".jpg"
            let url = URL(string: path)
            characterImageView.kf.setImage(with: url)
            nameLabel.text = character.name
            descriptionLabel.text = character.description
        }
    }

    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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

extension CharacterViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = collectionsTableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as! CollectionTableViewCell
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.collectionView.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0 : return "Comics"
        case 1 : return "Series"
        case 2 : return "Stories"
        case 3 : return "Events"
        default: return ""

        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
//               headerView.contentView.backgroundColor = .white
//               headerView.backgroundView?.backgroundColor = .black
               headerView.textLabel?.textColor = .red
           }
    }
    
    
    
}

extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        return cell
    }
    
    
}
