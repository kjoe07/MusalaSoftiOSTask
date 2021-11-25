//
//  ListDayTableViewCell.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import UIKit
import Kingfisher
class ListDayTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: ListDayTableViewCell.self)
    }

    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var imageICon: UIImageView!
    @IBOutlet weak var winSpedd: UILabel!
    @IBOutlet weak var windDirectionCompass: UILabel!
    @IBOutlet weak var winDirection: UILabel!
    @IBOutlet weak var airPresure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var visibility: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: ListDayCellRepresentable) {
        dayName.text = viewModel.dayName
        temp.text = viewModel.dayTemp
        imageICon.kf.setImage(with: viewModel.imageURl)
        winSpedd.text = viewModel.windSpeed
        windDirectionCompass.text = viewModel.windDirectionCompass
        winDirection.text = viewModel.windDirection
        airPresure.text = viewModel.airPresure
        humidity.text = viewModel.humidity
        visibility.text = viewModel.visibility
    }

}
