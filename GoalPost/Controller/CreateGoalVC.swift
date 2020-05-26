//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Mohamed Adel on 5/26/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    // MARK: Properties
    var goalType: GoalType = .shortTerm
    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    // MARK: Action
    
    @IBAction func shortTermPressed(_ sender: UIButton) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    @IBAction func longTermPressed(_ sender: UIButton) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        
    }
    
    // MARK: Class Methods
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
       dismissDetail()
    }
    // MARK: Self Defined Methods
    
    
    
    
}
