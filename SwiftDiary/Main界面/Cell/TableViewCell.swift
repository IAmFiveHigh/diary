//
//  TableViewCell.swift
//  SwiftDiary
//
//  Created by 我是五高你敢信 on 2017/2/20.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel1: UILabel!
    
    @IBOutlet weak var dateLabel2: UILabel!
    
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var dateLabel3: UILabel!
    
    @IBOutlet weak var location: UILabel!
    override func awakeFromNib() {
       
        super.awakeFromNib()
        
        //设置圆圈
        circleView.layer.cornerRadius = 10
        circleView.layer.borderColor = UIColor.lightGray.cgColor
        circleView.layer.borderWidth = 1
        
        detailLabel.numberOfLines = 0
        
        
    }
    
    func updateCellWith(model: CellModel) {
        
        dateLabel1.text = model.date1
        dateLabel2.text = model.date2
        dateLabel3.text = model.date3
        detailLabel.text = model.detailText
        location.text = model.location
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
