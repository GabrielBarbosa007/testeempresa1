//
//  UserCell.swift
//  DesafioLogs
//
//  Created by Gabriel Barbosa on 25/04/2022.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configLabel()
    }
    
    public func setupCell(user: UserModel) {
        self.titleLabel.text = user.title
        self.descriptionLabel.text = user.body
    }
       func configLabel() {
        self.titleLabel.font = .systemFont(ofSize: 18)
        self.descriptionLabel.font = .systemFont(ofSize: 14)
        
    }

}
