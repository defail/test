//
//  PostRemote.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

struct PostRemote: Codable {
    var title: String?
    var thumbnailPath: String?
    var author: String?
    var creatingDate: Int?
    var numberOfComments: Int?
    var name: String?
    var fullImagePath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailPath = "thumbnail"
        case author
        case creatingDate = "created_utc"
        case numberOfComments = "num_comments"
        case name
        case fullImagePath = "url"
    }
}
