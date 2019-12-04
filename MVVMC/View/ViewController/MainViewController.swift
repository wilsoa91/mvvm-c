//
//  ViewController.swift
//  MVVMC
//
//  Created by Andrew Wilson-Jones on 04/12/2019.
//  Copyright © 2019 Andrew Wilson-Jones. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    @IBAction func firstTapped(_ sender: Any) {
        print("MainViewController firstTapped")
        coordinator?.goToFirstVC()
    }

    @IBAction func secondTapped(_ sender: Any) {
        print("MainViewController secondTapped")
        coordinator?.goToSecondVC()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainViewController viewDidLoad")
    }

}

