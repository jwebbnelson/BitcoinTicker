//
//  NetworkController.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import Foundation
import Alamofire

class NetworkController {
    
    /*
     -----------
     Image URLs
     -----------
     BTC: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609483/bitcoin_eqld4v.png',
     ETH: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609485/ethereum_nw0chu.png',
     XRP: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609486/ripple_p0xeut.png',
     BCH: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1512427497/bch_crmnz5.png',
     LTC: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1512427497/ltc_fjbqjf.png',
     DASH: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609484/dash_oltvqi.png',
     XEM: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609486/nem_imprip.png',
     BCC: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609486/bitconnect_oj1bo5.png',
     XMR: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609486/monero_wzk3ur.png',
     NEO: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1508609486/neo_fvoo6c.png',
     MIOTA: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1512510148/miota_2x_xkby9u.png',
     ADA: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1513434489/cardano_unympj.png',
     BTG: 'https://res.cloudinary.com/da7jhtpgh/image/upload/v1513434542/bitcoin-gold_reytam.png'
     */
    
    static let baseURL = URL(string:"https://api.coinmarketcap.com/v1/ticker/")!
    
    var coins: [Coin] = []
    
    
    // Request data from CoinMarketCap API
    func getCurrentCoinData(completion:@escaping() -> Void) {
        
        var coins:[Coin] = []
        
        Alamofire.request(NetworkController.baseURL).responseJSON { response in
            
            if let responseDictionaries = response.result.value as? [[String:AnyObject]] {
                
                for coinDictionary in responseDictionaries {
                    if let coin = Coin(json: coinDictionary) {
                        coins.append(coin)
                    }
                }
                
                self.coins = coins
                completion()
            } else {
                print("Coin dictionary response failure")
                completion()
            }
        }
    }
    
}


