//
//  UINavigationController+Extension.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 19/06/20.
//  Copyright © 2020 sharkberry. All rights reserved.
//

import Foundation
import UIKit

enum ScrollBehavior {
    case largeTitleFixed(barTintColor: UIColor? = nil)
    case largeTitleHidesOnScroll
    case compactFixed
}

extension UINavigationController {
    
    func setupScrollBehavior(_ scrollBehavior: ScrollBehavior) {
        
        switch scrollBehavior {
            
        case .largeTitleFixed(let barTintColor):
            self.navigationBar.prefersLargeTitles = true
            //configurando aparencia da navigationBar
            self.navigationBar.scrollEdgeAppearance = {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = barTintColor
                appearance.shadowColor = .clear
                return appearance
            }()
            
            //Impedir a LargeTitle de collapsar
            self.visibleViewController?.view.insertSubview(UIView(), at: 0)
            
        case .largeTitleHidesOnScroll:
            self.navigationBar.prefersLargeTitles = true
            //Configurando a navigation de forma que o texto suma quando a tableView for scrollada pra cima e a navigation colapsar
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
            self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationBar.shadowImage = UIImage()

        case .compactFixed:
            self.navigationBar.prefersLargeTitles = false
            break
        }
        
    }
    
}
