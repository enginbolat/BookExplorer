//
//  ISubjectGenericResponse.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

struct ISubjectGenericResponse<T: Decodable>: Decodable {
    let key, name, subjectType, solrQuery: String
    let workCount: Int
    let works: [T]

    enum CodingKeys: String, CodingKey {
        case key, name
        case subjectType = "subject_type"
        case solrQuery = "solr_query"
        case workCount = "work_count"
        case works
    }
}

// MARK: - Work
struct SubjectSt: Codable, Equatable, Hashable, Identifiable {
    var id: String { key ?? UUID().uuidString }

    let key, title: String?
    let editionCount, coverID: Int?
    let coverEditionKey: String?
    let subject, iaCollection: [String]?
    let printdisabled: Bool?
    let lendingEdition, lendingIdentifier: String?
    let authors: [Author]?
    let firstPublishYear: Int?
    let ia: String?
    let publicScan, hasFulltext: Bool?
    let availability: Availability?
    
    enum CodingKeys: String, CodingKey {
        case key, title
        case editionCount = "edition_count"
        case coverID = "cover_id"
        case coverEditionKey = "cover_edition_key"
        case subject
        case iaCollection = "ia_collection"
        case printdisabled = "printdisabled"
        case lendingEdition = "lending_edition"
        case lendingIdentifier = "lending_identifier"
        case authors
        case firstPublishYear = "first_publish_year"
        case ia
        case publicScan = "public_scan"
        case hasFulltext = "has_fulltext"
        case availability
    }
    
    var coverUrl: URL? {
        guard let coverID = coverID else { return nil }
        return URL(string: "https://covers.openlibrary.org/b/id/\(coverID)-M.jpg")
    }
}

// MARK: - Author
struct Author: Codable, Equatable, Hashable {
    let key, name: String?
}

// MARK: - Availability
struct Availability: Codable, Equatable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    
    let status: String?
    let availableToBrowse, availableToBorrow, availableToWaitlist, isPrintdisabled: Bool?
    let isReadable, isLendable: Bool?
    let isPreviewable: Bool?
    let identifier: String?
    let isbn: String?
    let oclc: String?
    let openlibraryWork, openlibraryEdition: String?
    let lastLoanDate, numWaitlist, lastWaitlistDate: String?
    let isRestricted: Bool?
    let isBrowseable: Bool?
    let src: String?

    enum CodingKeys: String, CodingKey {
        case status
        case availableToBrowse = "available_to_browse"
        case availableToBorrow = "available_to_borrow"
        case availableToWaitlist = "available_to_waitlist"
        case isPrintdisabled = "is_printdisabled"
        case isReadable = "is_readable"
        case isLendable = "is_lendable"
        case isPreviewable = "is_previewable"
        case identifier, isbn, oclc
        case openlibraryWork = "openlibrary_work"
        case openlibraryEdition = "openlibrary_edition"
        case lastLoanDate = "last_loan_date"
        case numWaitlist = "num_waitlist"
        case lastWaitlistDate = "last_waitlist_date"
        case isRestricted = "is_restricted"
        case isBrowseable = "is_browseable"
        case src = "__src__"
    }
}
