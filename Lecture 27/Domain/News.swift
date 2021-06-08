//
//  Country.swift
//  MVVM+DataSource+Coordinator
//
//  Created by Nika Kirkitadze on 05.06.21.
//

import Foundation

// MARK: - WelcomeElement
struct News: Codable {
    let list: [List]
    let loadMore: Bool
 
    enum CodingKeys: String, CodingKey {
        case list = "List"
        case loadMore = "LoadMore"
    }
}
 
struct List: Codable {
    let type, id: Int
    let title: String
    let seoTitle: JSONNull?
    let shortDescription, content: String
    let bigCoverPhotoURL, mediumCoverPhotoURL, smallCoverPhotoURL, sharePhotoURL: String
    let time: String
    let date: DateEnum
    let dateValue: String
    let dateWithoutYear: DateWithoutYear
    let dateYear: DateYear
    let categoryID, categoryTitle, categoryGrayIcon, categoryRedIcon: JSONNull?
    let articleSource: ArticleSource?
    let articleSourceURL: String
    let photoAltTag: String
    let articleType, additionalMedia2Type, additionalMedia3Type: Int
    let url: String
    let fullDate: String
    let isArticleTrusty: Bool
    let photoVideoDescription: String?
    let photoVideoSourceOrAuthor: String
    let followUpNewsID, followUpNewsTitle, followUpNewsCategoryID: JSONNull?
    let relatedArticleID: Int?
    let relatedArticleTitle: String?
    let relatedArticleCategoryID: JSONNull?
    let showPhoto: Bool
    let additionalMedia2PhotoURL, additionalMedia3PhotoURL, additionalContent2, additionalContent3: String
    let additionalMedia2VideoID, additionalMedia3VideoID, publishDate: String
    let pageID: JSONNull?
    let articleVideoID: String
    let imediVideoID, additionalMedia2ImediID, additionalMedia3ImediID: JSONNull?
    let jsHasMainMediaContent: Bool
    let jsMainMediaImageURL: String
 
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case id = "Id"
        case title = "Title"
        case seoTitle = "SeoTitle"
        case shortDescription = "ShortDescription"
        case content = "Content"
        case bigCoverPhotoURL = "BigCoverPhotoUrl"
        case mediumCoverPhotoURL = "MediumCoverPhotoUrl"
        case smallCoverPhotoURL = "SmallCoverPhotoUrl"
        case sharePhotoURL = "SharePhotoUrl"
        case time = "Time"
        case date = "Date"
        case dateValue = "DateValue"
        case dateWithoutYear = "DateWithoutYear"
        case dateYear = "DateYear"
        case categoryID = "CategoryId"
        case categoryTitle = "CategoryTitle"
        case categoryGrayIcon = "CategoryGrayIcon"
        case categoryRedIcon = "CategoryRedIcon"
        case articleSource = "ArticleSource"
        case articleSourceURL = "ArticleSourceUrl"
        case photoAltTag = "PhotoAltTag"
        case articleType = "ArticleType"
        case additionalMedia2Type = "AdditionalMedia2Type"
        case additionalMedia3Type = "AdditionalMedia3Type"
        case url = "Url"
        case fullDate = "FullDate"
        case isArticleTrusty = "IsArticleTrusty"
        case photoVideoDescription = "PhotoVideoDescription"
        case photoVideoSourceOrAuthor = "PhotoVideoSourceOrAuthor"
        case followUpNewsID = "FollowUpNewsId"
        case followUpNewsTitle = "FollowUpNewsTitle"
        case followUpNewsCategoryID = "FollowUpNewsCategoryId"
        case relatedArticleID = "RelatedArticleId"
        case relatedArticleTitle = "RelatedArticleTitle"
        case relatedArticleCategoryID = "RelatedArticleCategoryId"
        case showPhoto = "ShowPhoto"
        case additionalMedia2PhotoURL = "AdditionalMedia2PhotoUrl"
        case additionalMedia3PhotoURL = "AdditionalMedia3PhotoUrl"
        case additionalContent2 = "AdditionalContent2"
        case additionalContent3 = "AdditionalContent3"
        case additionalMedia2VideoID = "AdditionalMedia2VideoId"
        case additionalMedia3VideoID = "AdditionalMedia3VideoId"
        case publishDate = "PublishDate"
        case pageID = "PageId"
        case articleVideoID = "ArticleVideoId"
        case imediVideoID = "ImediVideoId"
        case additionalMedia2ImediID = "AdditionalMedia2ImediId"
        case additionalMedia3ImediID = "AdditionalMedia3ImediId"
        case jsHasMainMediaContent = "JsHasMainMediaContent"
        case jsMainMediaImageURL = "JsMainMediaImageUrl"
    }
}
 
enum ArticleSource: String, Codable {
    case articleSourceIMEDI = "IMEDI"
    case articleSourceImedi = "imedi"
    case imedi = "imedi "
    case wwwImediGe = "www.imedi.ge"
}
 
enum DateEnum: String, Codable {
    case the01ივნისი2021 = "01 ივნისი 2021"
    case the02ივნისი2021 = "02 ივნისი 2021"
    case the31მაისი2021 = "31 მაისი 2021"
}
 
enum DateWithoutYear: String, Codable {
    case the01ივნისი = "01 ივნისი"
    case the02ივნისი = "02 ივნისი"
    case the31მაისი = "31 მაისი"
}
 
enum DateYear: String, Codable {
    case the2021 = " 2021"
}
 
// MARK: - Encode/decode helpers
 
class JSONNull: Codable, Hashable {
 
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
 
    public var hashValue: Int {
        return 0
    }
 
    public init() {}
 
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
 
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

