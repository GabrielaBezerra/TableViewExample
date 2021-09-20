//
//  DemoSetup.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 20/09/21.
//  Copyright © 2021 sharkberry. All rights reserved.
//

import Foundation
import UIKit

enum DemoSetup {
    case storyboardViewController
    case viewCodeTableViewController

    func window(with scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: scene)

        switch self {
        case .storyboardViewController:
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let navigation = mainStoryboard.instantiateInitialViewController()
            window.rootViewController = navigation
            break

        case .viewCodeTableViewController:
            let tableViewController = TableViewController(style: .grouped)
            let navigation = UINavigationController(rootViewController: tableViewController)
            window.rootViewController = navigation
            break
        }

        window.makeKeyAndVisible()
        return window
    }

}
