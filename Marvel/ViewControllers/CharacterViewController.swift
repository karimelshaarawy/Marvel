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
    
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    var character: Character?
    var characterViewModel = CharacterViewModel()
   
    
    fileprivate func setupCollectionViews() {
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        comicsCollectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        characterViewModel.reloadComicsColletionView = comicsCollectionView.reloadData
        
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        seriesCollectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        characterViewModel.reloadSeriesColletionView = seriesCollectionView.reloadData
        
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        characterViewModel.reloadStoriesColletionView = storiesCollectionView.reloadData
        
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        eventsCollectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        characterViewModel.reloadEventsColletionView = eventsCollectionView.reloadData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewFromModel()
        
        setupCollectionViews()
        
        // Do any additional setup after loading the view.
        
        characterViewModel.updateCharacterList(comicsUrl: character?.comics?.collectionURI ?? "",seriesUrl: character?.series?.collectionURI ?? "",storiesUrl: character?.stories?.collectionURI ?? "",eventsUrl: character?.events?.collectionURI ?? "")
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

//extension CharacterViewController: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = collectionsTableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as! CollectionTableViewCell
//        cell.collectionView.dataSource = self
//        cell.collectionView.delegate = self
//        cell.collectionView.backgroundColor = .clear
//        characterViewModel.reloadComicsColletionView = cell.collectionView.reloadData
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        150
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section{
//        case 0 : return "Comics"
//        case 1 : return "Series"
//        case 2 : return "Stories"
//        case 3 : return "Events"
//        default: return ""
//
//        }
//    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let headerView = view as? UITableViewHeaderFooterView {
////               headerView.contentView.backgroundColor = .white
////               headerView.backgroundView?.backgroundColor = .black
//               headerView.textLabel?.textColor = .red
//           }
//    }
    
    
    
//}

extension CharacterViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(collectionView == comicsCollectionView){
            return characterViewModel.comicsList.count}
        if(collectionView == seriesCollectionView){
            return characterViewModel.seriesList.count}
        if(collectionView == storiesCollectionView){
            return characterViewModel.storiesList.count}
        if(collectionView == eventsCollectionView){
            return characterViewModel.eventsList.count}
            
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        if( collectionView == comicsCollectionView){
            cell.setupCellFromModel(model: characterViewModel.comicsList[indexPath.row])}
        else if(collectionView == seriesCollectionView){
            cell.setupCellFromModel(model: characterViewModel.seriesList[indexPath.row])}
         else if(collectionView == storiesCollectionView){
            cell.setupCellFromModel(model: characterViewModel.storiesList[indexPath.row])}
        else {
            cell.setupCellFromModel(model: characterViewModel.eventsList[indexPath.row])}
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 90, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ImageGalleryViewController") as! ImageGalleryViewController
            
        if( collectionView == comicsCollectionView){
            vc.collections = characterViewModel.comicsList}
        else if(collectionView == seriesCollectionView){
            vc.collections = characterViewModel.seriesList}
         else if(collectionView == storiesCollectionView){
             vc.collections = characterViewModel.storiesList}
        else {
            vc.collections = characterViewModel.eventsList}
        vc.index =  indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
