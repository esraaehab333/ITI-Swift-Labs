//
//  ThirdViewController.swift
//  lab2_2
//
//  Created by Nemo on 21/04/2026.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var onboardingImg3: UIImageView!
    @IBOutlet weak var onboardingTitle3: UILabel!
    @IBOutlet weak var onboardingSubTitle3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingImg3.image = UIImage(named: "third.ong")
    }
    @IBAction func startBtn(_ sender: UIButton) {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "homeVC")
        homeVC?.modalPresentationStyle = .fullScreen
        present(homeVC!,animated: true)
    }
}
