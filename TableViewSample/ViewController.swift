//
//  ViewController.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 04/05/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let items: [(text: String, color: UIColor)] = [
        (text: "Red", color: .red),
        (text: "Green", color: .green),
        (text: "Blue", color: .blue)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tirando a linha entre as celulas
        tableView.separatorStyle = .none
        
        //Instancia nib da celula customizada a partir da sua xib que está na main bundle
        let cellNib = UINib(nibName: CardTableViewCell.nibName, bundle: .main)
        //Registra a CardTableViewCell na tableView dessa tela. Agora a cell "pertence" a tableView.
        tableView.register(cellNib, forCellReuseIdentifier: CardTableViewCell.identifier)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier) as! CardTableViewCell
        
        let currentItem = items[indexPath.row]
        
        cell.label.text = currentItem.text
        cell.sideImageView.tintColor = currentItem.color
        
        return cell
    }

}

