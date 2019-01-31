//
//  GatesViewController.swift
//  Airlines
//
//  Created by Huchchappa, Abhilasha on 1/22/19.
//  Copyright © 2019 Huchchappa, Abhilasha. All rights reserved.
//

import UIKit

class GatesViewController: UIViewController {

    @IBOutlet weak var gatesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gatesTableView.rowHeight = UITableView.automaticDimension
        self.gatesTableView.estimatedRowHeight = UITableView.automaticDimension

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.title = "Gates"
    }
}

extension GatesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlightsCell") as? FlightsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GatesCell") as? GatesTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75.0
    }

}
