//
//  CardTableViewCell.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 04/05/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    static var nibName: String = "CardTableViewCell"
    static var identifier: String = "cardCell"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sideImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.masksToBounds = false    
        bgView.applyShadow()
    }
    
}
