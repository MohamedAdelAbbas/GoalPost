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
    
    func configureCell(description: String, type: String, progressAmount: String){
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type
        self.goalProgressLabel.text = String(describing: progressAmount)
    }
    
    
}
