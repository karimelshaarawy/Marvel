//
//  APIManager.swift
//  Marvel
//
//  Created by Karim Elshaarawy on 11/01/2024.
//

import Foundation
import Alamofire

class APIManager{
    
    private static let baseUrl = "https://gateway.marvel.com"
    private static let charactersLink = "/v1/public/characters"
    private static let publicKey = "d351e5cc6329f0aab6fa92d48141428e"
    private static let privateKey = "f1a1c5676e0beea0c776e0efab33ab1873d7a9cc"

    
    static func getCharachters(offset: Int,completion: @escaping (_ characters: DataClass?,_ error: Error?)-> Void){
        
        let timeStamp = NSDate().timeIntervalSince1970
        let hashString = String(timeStamp)+privateKey+publicKey
        let hash = Hash.getMD5(hashString: hashString)
        let parameters:Parameters = ["hash":hash,
                         "apikey": publicKey,
                         "ts":String(timeStamp),
                          "limit":"5",
                          "offset":offset]
        AF.request(baseUrl+charactersLink
,method: .get,parameters: parameters,encoding: URLEncoding.default).response{ response in
            guard response.error == nil else{
                print(response.error?.localizedDescription)
                completion(nil,response.error)
                return
            }
            
            guard let data = response.data else{
                print("Couldn't get data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode(CharacterRequest.self, from: data)
                completion(characters.data,nil)

            } catch let error{
                completion(nil,error)
            }
            
        }
        }
    
    static func getCollections(url: String,completion: @escaping (_ characters: [Collection]?,_ error: Error?)-> Void){
        
        let timeStamp = NSDate().timeIntervalSince1970
        let hashString = String(timeStamp)+privateKey+publicKey
        let hash = Hash.getMD5(hashString: hashString)
        let parameters:Parameters = ["hash":hash,
                         "apikey": publicKey,
                         "ts":String(timeStamp),
                          ]
        AF.request(url
,method: .get,parameters: parameters,encoding: URLEncoding.default).response{ response in
            guard response.error == nil else{
                print(response.error?.localizedDescription)
                completion(nil,response.error)
                return
            }
            
            guard let data = response.data else{
                print("Couldn't get data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode(CollectionRequest.self, from: data)
                completion(characters.data?.results,nil)

            } catch let error{
                completion(nil,error)
            }
            
        }
        }
        
    }
    

