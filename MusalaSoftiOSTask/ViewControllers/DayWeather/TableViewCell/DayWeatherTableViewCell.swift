//
//  DayWeatherTableViewCell.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import UIKit

class DayWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherName:UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var windDirection:UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var airPresure: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var visibilty: UILabel!
    @IBOutlet weak var predictability: UILabel!
    @IBOutlet weak var hourIco: UIImageView!
    @IBOutlet weak var dateCreated: UILabel!
   
    static var identifier: String {
        String(describing: DayWeatherTableViewCell.self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: DayWeatherCellRepresentable) {
        weatherName.text = "\(viewModel.weatherName) \n \n \(viewModel.weatherStateAbb)"
        windSpeed.text = viewModel.windSpeed.replacingOccurrences(of: "Wind:", with: "")
        windDirection.text = "\(viewModel.windDirection)  \(viewModel.windDirectionCompass)"
        temp.text = viewModel.temp
        airPresure.text = viewModel.airPresure
        humidity.text = viewModel.humidity.replacingOccurrences(of: "H:", with: "")
        predictability.text = viewModel.predictability
        dateCreated.text = viewModel.createdDate
        hourIco.kf.setImage(with: viewModel.imageURl)
        visibilty.text = viewModel.visibility.replacingOccurrences(of: "V:", with: "")
    }

}
