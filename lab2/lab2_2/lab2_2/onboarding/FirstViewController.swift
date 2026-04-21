//
//  FirstViewController.swift
//  lab2_2
//
//  Created by Nemo on 21/04/2026.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var onboardingImg1: UIImageView!
    @IBOutlet weak var onboardingTitle1: UILabel!
    @IBOutlet weak var onboardingSubTitle1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingImg1.image = UIImage(named: "first.png")
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
