//
//  MyTableViewCell.swift
//  lab2_2
//
//  Created by Nemo on 19/04/2026.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    //@IBOutlet weak var movieImageCustomCell: UIImageView!
    //@IBOutlet weak var movieTitleCustomCell: UILabel!
    @IBOutlet weak var movieImage :UIImageView!
    @IBOutlet weak var movieTitle:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = movieImage.frame.height / 2
        movieImage.clipsToBounds = true
        movieImage.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
