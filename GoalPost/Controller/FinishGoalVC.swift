//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Mohamed Adel on 5/26/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    // MARK: Outlets
    
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    // MARK: Properties
    var goalDescription: String!
    var goalTypt: GoalType!
    
    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    // MARK: Class Methods
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalTypt = type
    }
    
    // MARK: Action
    @IBAction func createGoalBtnPressed(_ sender: UIButton) {
        // Pass data into Core Data Goal Model
        self.save{ (complete) in
            if complete{
                dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    // MARK: Self Defined Methods
    
    func save(compleation: (_ finished: Bool) -> ()){
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalTypt.rawValue
        goal.goalCompleationValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("Successfully saved data.")
            compleation(true)
        }catch{
            debugPrint("Could not save: \(error.localizedDescription)")
            compleation(false)
        }
        
        
    }
    
    
    
}
