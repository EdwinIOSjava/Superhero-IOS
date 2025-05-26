//
//  SuperheroViewCell.swift
//  Superhero-IOS
//
//  Created by Mañanas on 22/5/25.
//

import UIKit

class SuperheroViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func render (superhero: Superhero) {
            nameLabel.text = superhero.name
            avatarImageView.loadFrom(url: superhero.image.url)
        }

    override func awakeFromNib() {
   super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
