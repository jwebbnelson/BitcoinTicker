//
//  DashboardTableViewCell.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import UIKit

enum Timeframe: Int {
    case hour = 0
    case day
    case week
}

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var largeNameLable: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topleftLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateCellWithInfo (coin:Coin, timeframe:Timeframe) {
        largeNameLable.text = coin.symbol
        topLabel.text = "$" + coin.priceUSD
        topleftLabel.text = coin.name
        
        var percentChange = ""
        switch timeframe {
        case .hour:
            percentChange = coin.percentChangeHour
        case .week:
            percentChange = coin.percentChangeWeek
        default:
            percentChange = coin.percentChangeDay
        }
        
        if percentChange.contains("-") {
            bottomLabel.textColor = .red
        } else {
            bottomLabel.textColor = .green
        }
        bottomLabel.text = percentChange + "%"
    }

}
