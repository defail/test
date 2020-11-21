//
//  PostRemote.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

struct PostRemote: Codable {
    var title: String?
    var thumbnail: String?
    var author: String?
    var creatingDate: Int?
    var numberOfComments: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnail
        case author
        case creatingDate = "created_utc"
        case numberOfComments = "num_comments"
    }
}
