//
//  Coin.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import Foundation

class Coin {
    
    private let kID = "id"
    private let kName = "name"
    private let kSymbol = "symbol"
    private let kRank = "rank"
    private let kPriceUSD = "price_usd"
    private let kPriceBTC = "price_btc"
    private let k24hrVolume = "24h_volume_usd"
    private let kMarketCapUSD = "market_cap_usd"

    var id: String
    var name: String
    var symbol: String
    var rank: String
    var priceUSD: String
    var priceBTC: String
    var volume24Hr: String
    
    init?(json:[String:AnyObject]){
        
        guard let name = json[kName] as? String, let id = json[kID] as? String,
        let symbol = json[kSymbol] as? String, let rank = json[kRank] as? String,
        let priceUSD = json[kPriceUSD] as? String, let priceBTC = json[kPriceBTC] as? String,
        let volume24Hr = json[k24hrVolume] as? String
            else {
                self.id = ""
                self.name = ""
                self.symbol = ""
                self.rank = ""
                self.priceUSD = ""
                self.priceBTC = ""
                self.volume24Hr = ""
            return
        }
        
        self.name = name
        self.id = id
        self.symbol = symbol
        self.rank = rank
        self.priceUSD = priceUSD
        self.priceBTC = priceBTC
        self.volume24Hr = volume24Hr
    }
    
    
}
