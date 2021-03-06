//
//  GoalCell.swift
//  GoalPost
//
//  Created by Mohamed Adel on 5/26/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    

    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configureCell(goal: Goal){
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(describing: goal.goalProgress)
        if goal.goalProgress == goal.goalCompleationValue{
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
    
    
}
