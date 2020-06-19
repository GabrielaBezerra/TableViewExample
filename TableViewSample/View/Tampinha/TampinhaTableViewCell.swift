//
//  TampinhaTableViewCell.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 18/06/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import UIKit

class TampinhaTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    let tampinhaArray: [UIImage] = [
        #imageLiteral(resourceName: "blue"), #imageLiteral(resourceName: "black"), #imageLiteral(resourceName: "green"), #imageLiteral(resourceName: "gray"), #imageLiteral(resourceName: "yellow")
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "TampinhaCollectionViewCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: TampinhaCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TampinhaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tampinhaArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TampinhaCollectionViewCell.identifier, for: indexPath) as! TampinhaCollectionViewCell
        cell.imageView.image = tampinhaArray[indexPath.row]
        return cell
    }
    
}
