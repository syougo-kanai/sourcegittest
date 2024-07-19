//
//  GaugeViewCell.swift
//  tesr
//
//  Created by 株式会社三星製作所 on 2024/07/18.
//

import UIKit

class GaugeViewCell: UITableViewCell {
    
    @IBOutlet weak var startHour: UILabel!
    @IBOutlet weak var startMinute: UILabel!
    
    @IBOutlet weak var endHour: UILabel!
    @IBOutlet weak var endMinute: UILabel!
    
    @IBOutlet weak var samWork: UILabel!
    @IBOutlet weak var bekidou: UILabel!
    @IBOutlet weak var gaugeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
