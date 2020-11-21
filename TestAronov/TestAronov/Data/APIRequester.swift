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
    
    static func getTopPosts(limit: Int, after: String?, completion: @escaping  NetworkRetrievalHandler<[PostRemote]>) {
        guard let url = getUrlFromParams(path: "top.json",
                                         params: ["limit": String(limit),
                                                  "after": after]) else {
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

    static func getUrlFromParams(path: String, params: [String: String?]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "reddit.com"
        components.path = "/\(path)"
        components.queryItems = params.compactMap({ item in
            guard item.value != nil else { return nil }
            return URLQueryItem(name: item.key, value: item.value)
        })
        return components.url
    }
}
