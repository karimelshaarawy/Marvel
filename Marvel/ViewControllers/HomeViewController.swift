//
//  ViewController.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 11/01/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var charactersTableView: UITableView!
    
    var charactersViewModel = HomeViewModel()
    var offset = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        charactersViewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.charactersTableView.reloadData()
            }
        }
        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        charactersTableView.register(CharacterTableViewCell.nib, forCellReuseIdentifier: CharacterTableViewCell.identifier)
//        charactersViewModel.updateCharacterList(offset: offset)
//        offset += 5
      
    }
    


}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewModel.characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = charactersTableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        cell.fetchDataFromViewModel(model: charactersViewModel.characterList[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(charactersViewModel.totalItems ?? 0 > charactersViewModel.characterList.count){
            let lastSectionIndex = tableView.numberOfSections - 1
            let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
            if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
                // print("this is the last cell")
                let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                
                self.charactersTableView.tableFooterView = spinner
                self.charactersTableView.tableFooterView?.isHidden = false
                charactersViewModel.updateCharacterList(offset: offset)
                offset += 5
            }}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CharacterViewController") as! CharacterViewController
        vc.character = charactersViewModel.characterList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

