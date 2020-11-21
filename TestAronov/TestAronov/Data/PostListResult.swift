//
//  PostListResult.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

struct PostListResult: Codable {
    var posts: [PostRemote]?
    
    enum NestedCodingKeys: String, CodingKey {
        case data
        case children
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NestedCodingKeys.self)
        let rootData = try? container.nestedContainer(keyedBy: NestedCodingKeys.self, forKey: NestedCodingKeys.data)
        let childrenPosts = try? rootData?.decode([PostChildrenRemote].self, forKey: .children)
        posts = childrenPosts?.compactMap({ $0.post })
    }
}

struct PostChildrenRemote: Codable {
    var post: PostRemote?
    
    enum CodingKeys: String, CodingKey {
        case post = "data"
    }
}
