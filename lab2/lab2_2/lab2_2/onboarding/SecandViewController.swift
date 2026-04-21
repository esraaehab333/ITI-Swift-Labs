//
//  SecandViewController.swift
//  lab2_2
//
//  Created by Nemo on 21/04/2026.
//

import UIKit

class SecandViewController: UIViewController {
    @IBOutlet weak var onboardingImg2: UIImageView!
    @IBOutlet weak var onboardingTitle2: UILabel!
    @IBOutlet weak var onboardingSubTitle2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingImg2.image = UIImage(named: "secand.png")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
