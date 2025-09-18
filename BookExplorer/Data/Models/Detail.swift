//
//  Detail.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

// MARK: - Detail
import Foundation

// MARK: - Detail
struct Detail: Decodable {
    let title: String?
    let key: String?
    let description: StringOrObject?
    let authors: [AuthorDetail]?
    let type: TypeClass?
    let covers: [Int]?
    let firstSentence: StringOrObject?
    let firstPublishDate: String?
    let links: [Link]?
    let subjectPlaces, subjects, subjectPeople, subjectTimes: [String]?
    let excerpts: [Excerpt]?
    let latestRevision, revision: Int?
    let created, lastModified: Created?

    enum CodingKeys: String, CodingKey {
        case title, key, authors, type, description, covers
        case firstSentence = "first_sentence"
        case firstPublishDate = "first_publish_date"
        case subjectPlaces = "subject_places"
        case subjects
        case subjectPeople = "subject_people"
        case subjectTimes = "subject_times"
        case excerpts
        case links
        case latestRevision = "latest_revision"
        case revision, created
        case lastModified = "last_modified"
    }
    
    var coverUrl: URL? {
        guard let covers = covers, let firstCover = covers.first else { return nil }
        return URL(string: "https://covers.openlibrary.org/b/id/\(firstCover)-M.jpg")
    }
}

// MARK: - Author
struct AuthorDetail: Decodable {
    let author: TypeClass?
    let type: TypeClass?
}

// MARK: - TypeClass
struct TypeClass: Decodable {
    let key: String?
}

// MARK: - Created
struct Created: Decodable {
    let type: String?
    let value: String?
}

// MARK: - Excerpt
struct Excerpt: Decodable {
    let excerpt: String?
    let comment: String?
    let author: TypeClass?
}

// MARK: - Link
struct Link: Decodable {
    let title: String?
    let url: String?
    let type: TypeClass?
}

// MARK: - StringOrObject (çünkü bazı alanlar string, bazıları object gelebiliyor)
enum StringOrObject: Decodable {
    case string(String)
    case object(Created)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let str = try? container.decode(String.self) {
            self = .string(str)
        } else if let obj = try? container.decode(Created.self) {
            self = .object(obj)
        } else {
            throw DecodingError.typeMismatch(
                StringOrObject.self,
                DecodingError.Context(codingPath: decoder.codingPath,
                                      debugDescription: "Expected String or Created object")
            )
        }
    }
}

extension StringOrObject {
    var text: String {
        switch self {
        case .string(let str):
            return str
        case .object(let created):
            return created.value ?? ""
        }
    }
}

extension Detail {
    var formattedPublishDate: String {
        guard let dateString = created?.value else { return "N/A" }
        
        // Denenecek formatlar (bazı tarihlerde milisaniye var, bazılarında yok)
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSS",
            "yyyy-MM-dd'T'HH:mm:ss"
        ]
        
        let date: Date? = formats.compactMap { format in
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX") // parse için sabit
            formatter.dateFormat = format
            return formatter.date(from: dateString)
        }.first
        
        if let date = date {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .long   // Locale göre uzun format (örn: 17 Ekim 2009)
            displayFormatter.locale = Locale(identifier: "tr_TR")
            return displayFormatter.string(from: date)
        }
        
        return dateString // fallback
    }
}
