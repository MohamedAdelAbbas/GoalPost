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

        
    }
    
    // MARK: Action
    
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        print("done")
    }
    // MARK: Class Methods
    
    
    // MARK: Self Defined Methods
    
}

//extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
//    // MARK: - Table view data source
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    // MARK: - Table view delegate
//    
//}
