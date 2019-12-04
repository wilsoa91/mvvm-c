//
//  FirstViewController.swift
//  MVVMC
//
//  Created by Andrew Wilson-Jones on 04/12/2019.
//  Copyright © 2019 Andrew Wilson-Jones. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, Storyboarded {

    weak var coordinator: FirstCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstViewController viewDidLoad")
    }

//    override func viewDidDisappear(_ animated: Bool) {
//        coordinator?.viewControllerDismissed()
//    }

}
