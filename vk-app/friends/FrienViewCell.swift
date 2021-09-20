//
//  FrienViewCell.swift
//  3l_DmitrievSergey
//
//  Created by Sergey Dmitriev on 11.04.2021.
//

import UIKit

@IBDesignable class FrienViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var likeCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confCell(image: UIImage?){
        if let image = image {
            myImage.image = image
        }
    }

    
    @IBAction func likeButton(_ sender: Any) {
        if likeCount == 0 {
            likeCount = 1
            likeCountLabel.text = "\(likeCount)"
            heartImage.image = UIImage(named: "heartLike")
        } else {
            likeCount = 0
            likeCountLabel.text = "\(likeCount)"
            heartImage.image = UIImage(named: "heartUnlike")
        }
        
        
    }
    
    
}
