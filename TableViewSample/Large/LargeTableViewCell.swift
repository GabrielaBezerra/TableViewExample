//
//  LargeTableViewCell.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 06/05/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import UIKit

class LargeTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Deixando o shadow passar das fronteiras da mascara da layer da contentView da celula
        self.contentView.layer.masksToBounds = false
        bgView.applyShadow()
    }
    
}

extension UIView {
    func applyShadow() {
        //Criando e aplicando a shadow
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.3
    }
}
