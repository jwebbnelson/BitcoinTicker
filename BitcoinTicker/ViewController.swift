//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkController = NetworkController()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        networkController.getCurrentCoinData {
          print(self.networkController.coins[0])
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

