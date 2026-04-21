//
//  MyPageViewController.swift
//  lab2_2
//
//  Created by Nemo on 21/04/2026.
//

import UIKit

class MyPageViewController: UIPageViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource{
    // array to store the views
    var array = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstScreen = self.storyboard?.instantiateViewController(identifier: "firstVC")
        let secondScreen = self.storyboard?.instantiateViewController(withIdentifier: "secandVC")
        let thirdScreen = self.storyboard?.instantiateViewController(withIdentifier: "thirdVC")
        array.append(firstScreen!)
        array.append(secondScreen!)
        array.append(thirdScreen!)
        delegate = self
        dataSource = self
        if let firstScreen = array.first{
            setViewControllers([firstScreen], direction: .forward, animated:true)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = array.firstIndex(of: viewController) else { return nil }
        
        let previous = currentIndex - 1
        guard previous >= 0 else { return nil }
        
        return array[previous]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = array.firstIndex(of: viewController) else { return nil }
        
        let next = currentIndex + 1
        guard next < array.count else { return nil }
        
        return array[next]
    }
}
