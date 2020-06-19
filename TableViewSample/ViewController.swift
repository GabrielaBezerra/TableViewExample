//
//  ViewController.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 04/05/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import UIKit

enum CellTypes {
    case fire(text: String, color: UIColor)
    case largeAnt
    case tampinhas
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items: [CellTypes] = [
        .fire(text: "Red", color: .red),
        .fire(text: "Green", color: .green),
        .largeAnt,
        .tampinhas
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
        
        //Instancia nib da celula customizada a partir da sua xib que está na main bundle
        let largeNib = UINib(nibName: "LargeTableViewCell", bundle: .main)
        //Registra a CardTableViewCell na tableView dessa tela. Agora a cell "pertence" a tableView.
        tableView.register(largeNib, forCellReuseIdentifier: "largeCell")
        
        //Instancia nib da celula customizada a partir da sua xib que está na main bundle
        let tampinhaNib = UINib(nibName: "TampinhaTableViewCell", bundle: .main)
        //Registra a CardTableViewCell na tableView dessa tela. Agora a cell "pertence" a tableView.
        tableView.register(tampinhaNib, forCellReuseIdentifier: "tampinhaCell")
        
        //Chama função que faz setup do comportamento da NavigationBar quando a tableView é scrollada
        setupNavigationBar(hidesOnScroll: true)
    }
    
    func setupNavigationBar(hidesOnScroll: Bool) {
        
        if hidesOnScroll {
            //Configurando a navigation de forma que o texto suma quando a tableView for scrollada pra cima e a navigation colapsar
            self.navigationController?.navigationBar.isOpaque = false
            self.navigationController?.navigationBar.backgroundColor = .clear
            self.navigationController?.navigationBar.barTintColor = .clear
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        } else {
            //Impedir a LargeTitle de collapsar
            self.navigationController?.navigationBar.isOpaque = true
            self.navigationController?.navigationBar.backgroundColor = self.view.backgroundColor
            self.navigationController?.navigationBar.barTintColor = self.view.backgroundColor
            view.insertSubview(UIView(), at: 0)
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentItem = items[indexPath.row]
        
        switch currentItem {
        case .fire(let text, let color):
            let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier) as! CardTableViewCell
            cell.label.text = text
            cell.sideImageView.tintColor = color
            return cell
            
        case .largeAnt:
            let cell = tableView.dequeueReusableCell(withIdentifier: "largeCell") as! LargeTableViewCell
            return cell
            
        case .tampinhas:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tampinhaCell") as! TampinhaTableViewCell
            return cell
        }
        
    }
    
}

