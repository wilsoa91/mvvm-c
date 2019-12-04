//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by Andrew Wilson-Jones on 04/12/2019.
//  Copyright © 2019 Andrew Wilson-Jones. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: Coordinator Setup

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /**Create coordinator and respective ViewController, and push onto navigationController*/
    func start() {
        print("MainCoordinator start")
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }

    // MARK: ViewController Navigation

    /**Navigate to FirstViewController by creating and starting a FirstCoordinator*/
    func goToFirstVC() {
        print("MainCoordinator goToFirstVC")
        let child = FirstCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }

    /**Navigate to SecondViewController by creating and starting a SecondCoordinator*/
    func goToSecondVC() {
        print("MainCoordinator goToSecondVC")
        let child = SecondCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }

    /**When app navigation occurs, check which ViewController we have left and then call childDidFinish on its coordinator*/
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("MainCoordinator navigationController")
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a first view controller
        if let firstViewController = fromViewController as? FirstViewController {
            // We're popping a first view controller; end its coordinator
            print("saveString is: " + firstViewController.coordinator!.saveString)
            childDidFinish(firstViewController.coordinator)
        }else if let secondViewController = fromViewController as? SecondViewController{
            childDidFinish(secondViewController.coordinator)
        }

    }

    /**Called when a child coordinator's ViewController is being dismissed. Remove child coordinator from our array*/
    private func childDidFinish(_ child: Coordinator?) {
        print("MainCoordinator childDidFinish")
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
