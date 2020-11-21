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
    
}
