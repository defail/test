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
    var preview: PreviewPostRemote?
    
    var isDefaultThumnbnail: Bool{
        return thumbnailPath?.lowercased() == "default"
    }
    
    var sourceImageUrl: String? {
        return preview?.images?.first?.source?.url
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailPath = "thumbnail"
        case author
        case creatingDate = "created_utc"
        case numberOfComments = "num_comments"
        case name
        case preview
    }
}

struct PreviewPostRemote: Codable {
    var images: [ImagesRemote]?
}

struct ImagesRemote: Codable {
    var source: ImageRemote?
}
