//
//  DayWeatherTableViewCell.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var wheatherName:UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection:UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var airPresure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var visibilty: UILabel!
    @IBOutlet weak var predictability: UILabel!
    @IBOutlet weak var hourIco: UIImageView!
    @IBOutlet weak var dateCreated: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: DayWeatherCellRepresentable) {
        
    }

}
