//
//  TableViewController.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 20/09/21.
//  Copyright © 2021 sharkberry. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {

    let items: [CellType] = [
        .dynamicViewCode(
            heading: "Leaf\n(plural leaves)",
            body: "Leaves can have many different shapes, sizes, and textures.",
            image: UIImage(named: "leaf")
        ),
        .dynamicViewCode(
            heading: "Lady Bug",
            body: "Coccinellidae (/ˌkɒksɪˈnɛlɪˌdiː/) is a widespread family of small beetles ranging in size from 0.8 to 18 mm (0.03 to 0.71 in). The family is commonly known as ladybugs in North America and ladybirds in Great Britain and other parts of the English-speaking world. Entomologists prefer the names ladybird beetles or lady beetles as these insects are not classified as true bugs.",
            image: UIImage(systemName: "ladybug", withConfiguration: UIImage.SymbolConfiguration(pointSize: 52))
        ),
        .fire(text: "Red", color: .red),
        .fire(text: "Green", color: .green),
        .largeAnt,
        .tampinhas
    ]

    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //titulo da navigation
        self.title = "TableViewController"

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

        //Chama função da extensão de UINavigationController que muda comportamento da NavigationBar quando a tableView é scrollada
        navigationController?.setupScrollBehavior(.largeTitleFixed(barTintColor: .none))

        //Configura UISearchController
        navigationItem.searchController = searchController
    }

}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("updating search results...")
    }
}

extension TableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let currentItem = items[indexPath.row]

        switch currentItem {

        case .dynamicViewCode(let heading, let body, let image):
            let cell = DynamicViewCodeCell(heading: heading, body: body, image: image)
            return cell

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
