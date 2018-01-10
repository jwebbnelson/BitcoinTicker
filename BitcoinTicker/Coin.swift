//
//  Coin.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import Foundation

class Coin {
    
    //    private let kID = "id"
    private let kName = "name"
    //    private let kSymbol = "symbol"
    //    private let kRank = "rank"
    //    private let kPriceUSD = "price_usd"
    //    private let kPriceBTC = "price_btc"
    //    private let k24hrVolume = "24h_volume_usd"
    //    private let kMarketCapUSD = "market_cap_usd"
    //
    var name: String
    
    init?(json:[String:AnyObject]){
        
        guard let name = json[kName] as? String else {
            self.name = ""
            return
        }
        
        self.name = name
    }
    
    
}
