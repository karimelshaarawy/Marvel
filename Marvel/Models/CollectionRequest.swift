// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let collectionRequest = try? JSONDecoder().decode(CollectionRequest.self, from: jsonData)

import Foundation

// MARK: - CollectionRequest
struct CollectionRequest: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CollectionDataClass?
}

// MARK: - DataClass
struct CollectionDataClass: Codable {
    let offset, limit, total, count: Int?
    let results: [Collection]?
}

// MARK: - Result
struct Collection: Codable {
    let id, digitalID: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription, description, modified, isbn: String?
    let upc, diamondCode, ean, issn: String?
    let format: String?
    let pageCount: Int?
   
    let resourceURI: String?
    let series: Series?
    let variants: [Series]?
    
   
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
    let creators: Creators?
    let characters: Characters?
    let stories: Stories?
    let events: Characters?

    enum CodingKeys: String, CodingKey {
        case id
        case digitalID = "digitalId"
        case title, issueNumber, variantDescription, description, modified, isbn, upc, diamondCode, ean, issn, format, pageCount, resourceURI, series, variants, thumbnail, images, creators, characters, stories, events
    }
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [Series]?
    let returned: Int?
}

// MARK: - Series
struct Series: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [CreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String?
    let name, role: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    let type: DateType?
    let date: Date?
}

enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
}

// MARK: - Thumbnail



// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Double?
}

// MARK: - Stories


// MARK: - StoriesItem


enum ItemType: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - TextObject
struct TextObject: Codable {
    let type, language, text: String?
}






