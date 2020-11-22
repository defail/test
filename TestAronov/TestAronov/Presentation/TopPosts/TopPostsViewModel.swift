//
//  TopPostsViewModel.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

final class TopPostsViewModel {
    
    var posts = [PostRemote]()
    
    private var isLoading = false
    
    var reloadData: (() -> ())?
    var endRefreshing: (() -> ())?
    
    init() {
        getPosts(refresh: true)
    }
    
    func getPosts(refresh: Bool) {
        guard !isLoading else { return }
        isLoading = true
        let after = refresh ? nil : posts.last?.name
        APIRequester.getTopPosts(limit: 20, after: after) { [weak self] (_, posts, _) in
            self?.isLoading = false
            self?.endRefreshing?()
            guard let posts = posts else { return }
            if refresh {
                self?.posts = posts
            } else {
                self?.posts.append(contentsOf: posts)
            }
            self?.reloadData?()
        }
    }
}
