//
//  TopPostTableViewCell.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import UIKit

class TopPostTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TopPostTableViewCell"

    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func setPost(_ post: PostRemote) {
        titleLabel.text = post.title
        authorLabel.text = post.author
        commentsLabel.text = "\(post.numberOfComments ?? 0) comments"
    }
}
