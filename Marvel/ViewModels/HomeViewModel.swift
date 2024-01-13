//
//  HomeViewModel.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 12/01/2024.
//

import Foundation
import UIKit

class HomeViewModel{
    var reloadTableView:(()->Void)?
    var characterList = [Character](){
        didSet{
            reloadTableView?()
        }
    }
    var totalItems: Int?
    var loadedFlag = false
    func updateCharacterList(offset: Int){
//        var characters = [Character]()
        
        APIManager.getCharachters(offset: offset) {[weak self] characters, error in
            if(error != nil){
                print(error!.localizedDescription)
            }else{
                if let characters = characters{
                    if let results = characters.results{
                        self?.characterList.append(contentsOf: results)
                        self?.totalItems = characters.total
                        self?.loadedFlag = true
                    }}
                
            }
        }
    }
    
}
