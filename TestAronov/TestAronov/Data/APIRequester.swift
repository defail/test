//
//  APIRequester.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import Foundation

typealias NetworkRetrievalHandler<T> = ((_ success: Bool, _ data: T?, _ error: String?) -> ())

final class APIRequester {
    static let baseUrl = "https://www.reddit.com/"
    
    static func getTopPosts(count: Int, limit: Int, completion: @escaping  NetworkRetrievalHandler<[PostRemote]>) {
        guard let url = getUrlFromParams(path: "top.json",
                                         params: ["count": String(count),
                                                  "limit": String(limit)]) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let result = try? JSONDecoder().decode(PostListResult.self, from: data) else {
                completion(false, nil, error?.localizedDescription)
                return
            }
            completion(true, result.posts ?? [], nil)
        }
        task.resume()
    }

    static func getUrlFromParams(path: String, params: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "reddit.com"
        components.path = "/\(path)"
        components.queryItems = params.compactMap( { URLQueryItem(name: $0.key, value: $0.value) } )
        return components.url
    }
}
