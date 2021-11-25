//
//  ListDayTableViewCell.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/25/21.
//

import UIKit

class ListDayTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: ListDayTableViewCell.self)
    }

    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var imageICon: UIImageView!
    
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
    }

}
