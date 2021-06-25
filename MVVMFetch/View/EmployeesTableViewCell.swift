//
//  EmployeesTableViewCell.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 04/09/20.
//  Copyright © 2020 Rodrigo Machado. All rights reserved.
//

import UIKit

class EmployeesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        ageLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.contentView.backgroundColor = selected ? .green : .none
    }
}
