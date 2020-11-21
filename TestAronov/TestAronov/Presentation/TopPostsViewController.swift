//
//  TopPostsViewController.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import UIKit
import SafariServices

final class TopPostsViewController: UIViewController {

    let viewModel = TopPostsViewModel()

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureVM()
    }
    
    private func configureVM() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.endRefreshing = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshPosts), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshPosts() {
        viewModel.getPosts(refresh: true)
    }
    
    private func displayInApp(url: String) {
        guard let url = URL(string: url) else { return }
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
}

extension TopPostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopPostTableViewCell.reuseIdentifier, for: indexPath) as! TopPostTableViewCell
        let post = viewModel.posts[indexPath.row]
        cell.setPost(post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let post = viewModel.posts[indexPath.row]
        guard let url = post.fullImagePath else { return }
        displayInApp(url: url)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.isNearBottomEdge(edgeOffset: 200) {
            viewModel.getPosts(refresh: false)
        }
    }
}
