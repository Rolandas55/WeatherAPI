//
//  WeatherTableViewCell.swift
//  WeatherAPI
//
//  Created by kraujalis.rolandas on 12/11/2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    //var cellImage: String = "CellSnow"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.backgroundView = UIImageView(image: UIImage(named: cellImage))
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
