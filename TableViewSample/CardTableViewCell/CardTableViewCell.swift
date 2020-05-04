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
        applyShadow()
    }
    
    func applyShadow() {
        //Deixando o shadow passar das fronteiras da mascara da layer da contentView da celula
        self.contentView.layer.masksToBounds = false
        
        //Criando e aplicando a shadow
        bgView.layer.cornerRadius = 20.0
        bgView.layer.shadowColor = UIColor.gray.cgColor
        bgView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        bgView.layer.shadowRadius = 2.0
        bgView.layer.shadowOpacity = 0.3
    }
    
}
