//
//  Todos.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

struct IGenericResponseRandomBook<T: Decodable>: Decodable {
    let numFound, start: Int?
    let numFoundExact: Bool?
    let num_found: Int?
    let documentation_url: String?
    let q: String?
    let offset: String?
    let docs: [T]?
    
    enum CodingKeys: String, CodingKey {
        case numFound, start, numFoundExact, q, offset, docs
        case num_found
        case documentation_url
    }
}


struct RandomBook: Decodable, Hashable, Identifiable {
    var id: String { key ?? UUID().uuidString }
    
    let authorKey, authorName: [String]?
    let ebookAccess: String
    let editionCount, firstPublishYear: Int?
    let hasFulltext: Bool?
    let key: String?
    let language: [String]?
    let publicScanB: Bool?
    let title: String
    let coverEditionKey: String?
    let coverI: Int?
    let ia: [String]?
    let iaCollectionS, lendingEditionS, lendingIdentifierS: String?
    
    enum CodingKeys: String, CodingKey {
        case authorKey = "author_key"
        case authorName = "author_name"
        case coverEditionKey = "cover_edition_key"
        case coverI = "cover_i"
        case ebookAccess = "ebook_access"
        case editionCount = "edition_count"
        case firstPublishYear = "first_publish_year"
        case hasFulltext = "has_fulltext"
        case ia
        case iaCollectionS = "ia_collection_s"
        case key
        case language
        case lendingEditionS = "lending_edition_s"
        case lendingIdentifierS = "lending_identifier_s"
        case publicScanB = "public_scan_b"
        case title
    }
    
    var coverURL: URL? {
        guard let coverI = coverI else { return nil }
        return URL(string: "https://covers.openlibrary.org/b/id/\(coverI)-M.jpg")
    }
}
