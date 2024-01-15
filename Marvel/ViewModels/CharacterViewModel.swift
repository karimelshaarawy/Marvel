//
//  CharacterViewModel.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 13/01/2024.
//

import Foundation
import UIKit

class CharacterViewModel{
    var reloadComicsColletionView:(()->Void)?
    var comicsList = [Collection](){
        didSet{
            reloadComicsColletionView?()
        }
    }

    var reloadSeriesColletionView:(()->Void)?
    var seriesList = [Collection](){
        didSet{
            reloadSeriesColletionView?()
        }
    }
    var reloadStoriesColletionView:(()->Void)?
    var storiesList = [Collection](){
        didSet{
            reloadStoriesColletionView?()
        }
    }
    var reloadEventsColletionView:(()->Void)?
    var eventsList = [Collection](){
        didSet{
            reloadEventsColletionView?()
        }
    }
    func updateCharacterList(comicsUrl: String,seriesUrl: String,storiesUrl: String,eventsUrl: String){
//        var characters = [Character]()
        
        APIManager.getCollections(url: comicsUrl) {[weak self] collections, error in
            if(error != nil){
                print(error!.localizedDescription)
            }else{
                if let collections = collections{
                    self?.comicsList = collections
                    }}
                
            }
        
        APIManager.getCollections(url: seriesUrl) {[weak self] collections, error in
            if(error != nil){
                print(error!.localizedDescription)
            }else{
                if let collections = collections{
                    self?.seriesList = collections
                    }}
                
            }
        APIManager.getCollections(url: storiesUrl) {[weak self] collections, error in
            if(error != nil){
                print(error!.localizedDescription)
            }else{
                if let collections = collections{
                    self?.storiesList = collections
                    }}
                
            }
        APIManager.getCollections(url: eventsUrl) {[weak self] collections, error in
            if(error != nil){
                print(error!.localizedDescription)
            }else{
                if let collections = collections{
                    self?.eventsList = collections
                    }}
                
            }
        }
    }
    

