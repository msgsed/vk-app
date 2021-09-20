//
//  GroupTableViewCell.swift
//  3l_DmitrievSergey
//
//  Created by Sergey Dmitriev on 11.04.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(groupName: String?, avatar: UIImage?){
        if let groupName = groupName {
            self.groupName.text = groupName
        }
        if let avatar = avatar {
            self.avatarImage.image = avatar
        }
    }
}
