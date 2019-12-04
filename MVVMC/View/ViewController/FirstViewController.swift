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

    @IBAction func dismissBtnTapped(_ sender: Any) {
        print("FirstViewController dismissBtnTapped")
        dismiss()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstViewController viewDidLoad")
        title = "FirstViewController"
    }

    func dismiss(){
        print("FirstViewController dismiss")
        coordinator?.viewControllerPopped(saveString: "TESTING")
        navigationController?.popViewController(animated: true)
    }

}
