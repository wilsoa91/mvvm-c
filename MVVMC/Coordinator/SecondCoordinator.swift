//
//  SecondCoordinator.swift
//  MVVMC
//
//  Created by Andrew Wilson-Jones on 04/12/2019.
//  Copyright © 2019 Andrew Wilson-Jones. All rights reserved.
//

import UIKit

class SecondCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("SecondCoordinator start")
        let vc = SecondViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

}
