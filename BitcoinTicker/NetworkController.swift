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
    
    
    static let baseURL = URL(string:"https://api.coinmarketcap.com/v1/ticker/")!
    
    var coins: [Coin] = []
    
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


