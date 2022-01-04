//
//  SearchRepositoryTableViewCell.swift
//  APITestPractice
//
//  Created by 大谷空 on 2022/01/03.
//

import UIKit

class SearchRepositoryTableViewCell: UITableViewCell {
    
    var repositoryItem: Item? {
        didSet {
            if let fullName = repositoryItem?.fullName {
                fullNameLabel.text = fullName
            }
        }
    }
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
