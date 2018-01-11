//
//  DashboardViewController.swift
//  BitcoinTicker
//
//  Created by Jordan on 1/10/18.
//  Copyright © 2018 Canvas. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    let networkController = NetworkController()
    var timeframe:Timeframe = .day
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeframeButton: UIBarButtonItem!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkController.getCurrentCoinData {
            print(self.networkController.coins[0])
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.addSubview(self.refreshControl)
    }

    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        // Do some reloading of data and update the table view's data source
        // Fetch more objects from a web service, for example...
        
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    // Reset timeframe and reload tableview
    @IBAction func timeFrameTapped(_ sender: Any) {
        switch self.timeframe {
        case .hour:
            self.timeframe = .day
            self.timeframeButton.title = "24HR"
        case .week:
            self.timeframe = .hour
            self.timeframeButton.title = "1HR"
        default:
             self.timeframe = .week
            self.timeframeButton.title = "7D"
        }
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell", for: indexPath) as! DashboardTableViewCell
        
        let coin = networkController.coins[indexPath.row]
        cell.updateCellWithInfo(coin: coin, timeframe: self.timeframe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkController.coins.count
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}


