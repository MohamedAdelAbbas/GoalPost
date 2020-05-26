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
        @IBOutlet weak var undoView: UIView!
    // MARK: Properties
    
     var goals: [Goal] = []
    var lastRemovedGoalDesc: String?
    var lastRemovedGoalType: String?
    var lastRemovedGoalCompletionValue: Int32?
    var lastRemovedGoalProgress: Int32?
    
    // MARK: View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview.isHidden = false
        undoView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           fetchCoreDataObjects()
           tableview.reloadData()
       }
       override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
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
       }
    // MARK: Action
    
    @IBAction func addGoalBtnPressed(_ sender: UIButton) {
        guard let CreateGoalVC = storyboard?.instantiateViewController(identifier: "CreateGoalVC")else{return}
        presentDetail(CreateGoalVC)
        undoView.isHidden = true
    }
    
    @IBAction func undoBtnPressed(_ sender: UIButton) {
        let oldGoal = Goal(context: managedContext)
               oldGoal.goalDescription = lastRemovedGoalDesc
               oldGoal.goalType = lastRemovedGoalType
               oldGoal.goalCompleationValue = lastRemovedGoalCompletionValue!
               oldGoal.goalProgress = lastRemovedGoalProgress!
               
               do {
                   try managedContext.save()
                   undoView.isHidden = true
                    fetchCoreDataObjects()
                    tableview.reloadData()
                   print("Successfully undo'd")
               } catch {
                   debugPrint("Could not undo \(error.localizedDescription)")
               }
    }
    
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
        // Delete goal
        let delGoal = goals[indexPath.row]
        
        lastRemovedGoalDesc = delGoal.goalDescription
        lastRemovedGoalType = delGoal.goalType
        lastRemovedGoalCompletionValue = delGoal.goalCompleationValue
        lastRemovedGoalProgress = delGoal.goalProgress
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            undoView.isHidden = false
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
     func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
    
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
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
             self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .fade)
            completionHandler(true)
            }

        let addAction = UIContextualAction(style: .destructive, title: "Add 1") { (action, sourceView, completionHandler) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.image = UIImage(named: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        addAction.backgroundColor = #colorLiteral(red: 0.961445272, green: 0.650790751, blue: 0.1328578591, alpha: 1)

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, addAction])
        return swipeConfiguration
    }

//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
//            
//            completionHandler(true)
//        }
//        let checkInIcon = restaurants[indexPath.row].isVisited ? "undo" : "tick"
//        checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
//        checkInAction.image = UIImage(named: checkInIcon)
//        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
//        return swipeConfiguration
//    }
    
}
