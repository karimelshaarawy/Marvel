//
//  ImageGalleryViewController.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 15/01/2024.
//

import UIKit

class ImageGalleryViewController: UIViewController {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var collections: [Collection]?
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.register(GalleryCollectionViewCell.nib, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
//        let indexPath = IndexPath(item: index, section: 0)
//            self.imageCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let indexPath = IndexPath(item: index, section: 0)
        self.imageCollectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally], animated: false)
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

extension ImageGalleryViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        if let collections = collections{
            let numLabelText = "\(String(indexPath.row + 1))/\(String(collections.count ))"
            cell.setupFromModel(model: collections[indexPath.row], num:numLabelText )
                                
                                }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 350, height: 600)
    }
    
    
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
