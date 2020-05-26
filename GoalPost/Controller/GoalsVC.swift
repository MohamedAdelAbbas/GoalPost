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
    
     var goals: [Goal] = []
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           fetchCoreDataObjects()
        tableview.reloadData()
       }
       
       func fetchCoreDataObjects() {
           self.fetch { (complete) in
               if complete {
                   if goals.count >= 1 {
                       tableview.isHidden = false
                   } else {
                       tableview.isHidden = true
                   }
               }
           }
        tableview.reloadData()
       }
    // MARK: Action
    
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        guard let CreateGoalVC = storyboard?.instantiateViewController(identifier: "CreateGoalVC")else{return}
        presentDetail(CreateGoalVC)
    }
    // MARK: Class Methods
    
    
    // MARK: Fetech Data From Presitant Store Methods
    func setProgress(atIndexPath indexPath: IndexPath) {
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompleationValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else {
            return
        }
        
        do {
            try managedContext.save()
            print("Successfully set progress!")
        } catch {
            debugPrint("Could not set progress: \(error.localizedDescription)")
        }
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed goal!")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
       
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell") as? GoalCell else{return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    // MARK: - Table view delegate
    
}
