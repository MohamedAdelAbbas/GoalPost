//
//  GoalsVC.swift
//  GoalPost
//
//  Created by Mohamed Adel on 5/25/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import CoreData
class GoalsVC: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableview: UITableView!
    
    // MARK: Properties
    
    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.isHidden = false
        
    }
    
    // MARK: Action
    
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        print("done")
    }
    // MARK: Class Methods
    
    
    // MARK: Self Defined Methods
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else{return UITableViewCell()}
        cell.configureCell(description: "Eat saled twice a week", type: .shortTerm, progressAmount: 2)
        return cell
    }
    
    // MARK: - Table view delegate
    
}
