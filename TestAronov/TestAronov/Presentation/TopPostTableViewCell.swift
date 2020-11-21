//
//  TopPostTableViewCell.swift
//  TestAronov
//
//  Created by defail on 11/21/20.
//

import UIKit

protocol TopPostTableViewCellDelegate: class {
    func imageTapped(_ image: UIImage)
}

class TopPostTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "TopPostTableViewCell"

    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    weak var delegate: TopPostTableViewCellDelegate?
    private var tapGesture: UITapGestureRecognizer?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = #imageLiteral(resourceName: "defaultImage")
        guard let tap = tapGesture else { return }
        avatarImageView.removeGestureRecognizer(tap)
    }
    
    func setPost(_ post: PostRemote) {
        titleLabel.text = post.title
        authorLabel.text = post.author
        commentsLabel.text = "\(post.numberOfComments ?? 0) comments"
        if !post.isDefaultThumnbnail ,let path = post.thumbnailPath {
            avatarImageView.imageFromServerURL(urlString: path)
        } else {
            avatarImageView.image = #imageLiteral(resourceName: "defaultImage")
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        tapGesture = tap
        avatarImageView.addGestureRecognizer(tap)
    }
    
    @objc private func imageTap() {
        guard let image = avatarImageView.image else { return }
        delegate?.imageTapped(image)
    }
}

