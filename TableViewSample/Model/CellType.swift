//
//  CellType.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 19/06/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import Foundation
import UIKit

enum CellType {
    case fire(text: String, color: UIColor)
    case largeAnt
    case tampinhas
    case dynamicViewCode(heading: String, body: String, image: UIImage?)
}
