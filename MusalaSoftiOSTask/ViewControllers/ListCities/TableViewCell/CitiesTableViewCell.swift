//
//  CitiesTableViewCell.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/23/21.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    static var identifier: String {
        String(describing: CitiesTableViewCell.self)
    }
    
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(viewModel: CitiesTableViewCellRepresentable) {
        titleLable.text = viewModel.locationName
    }

}
