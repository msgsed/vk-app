//
//  UserTableViewCell.swift
//  3l_DmitrievSergey
//
//  Created by Sergey Dmitriev on 11.04.2021.
//

import UIKit

@IBDesignable class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var avatarView: UIView!
    
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacityPercent: Float = 90 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }

    func clearCell() {
        avatarImage.image = nil
    }
    
    func setup() {
        avatarView.layer.cornerRadius = avatarView.frame.size.height / 2
        //avatarView.layer.shadowOpacity = 0.9
        avatarView.layer.shadowOpacity = shadowOpacityPercent / 100
        //avatarView.layer.shadowRadius = 10
        avatarView.layer.shadowRadius = shadowRadius
        avatarView.layer.shadowOffset = CGSize.zero
        //avatarView.layer.shadowColor = UIColor.black.cgColor
        avatarView.layer.shadowColor = shadowColor.cgColor
        avatarImage.layer.cornerRadius = avatarView.frame.size.height / 2
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clearCell()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(name: String?, type: String?, avatar: UIImage?){
        if let name = name {
            self.nameLabel.text = name
        }
        if let type = type {
            self.typeLabel.text = type
        }
        if let avatar = avatar {
            self.avatarImage.image = avatar
        }
    }
    
}
