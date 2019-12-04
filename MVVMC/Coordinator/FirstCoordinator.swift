//
//  FirstCoordinator.swift
//  MVVMC
//
//  Created by Andrew Wilson-Jones on 04/12/2019.
//  Copyright © 2019 Andrew Wilson-Jones. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("FirstCoordinator start")
        let vc = FirstViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

//    func viewControllerDismissed(){
//        parentCoordinator?.childDidFinish(self)
//    }
}
