//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Mohamed Adel on 5/26/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

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
        
    }
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    
    // MARK: Self Defined Methods
    // MARK: - Table view data source
    // MARK: - Table view delegate
    
    
    
}
