//
//  MyCollectionViewController.swift
//  lab4_1(SDWebImage)
//
//  Created by Nemo on 19/04/2026.
//

import UIKit
import SDWebImage
private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {
    let listOfImages = [
        "https://picsum.photos/id/1/400/400",
        "https://picsum.photos/id/10/400/400",
        "https://picsum.photos/id/20/400/400",
        "https://picsum.photos/id/30/400/400",
        "https://picsum.photos/id/40/400/400",
        "https://picsum.photos/id/50/400/400",
        "https://picsum.photos/id/60/400/400",
        "https://picsum.photos/id/60/400/400"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30, height: 180)//width screen /2  and add margin
        collectionView.collectionViewLayout = layout
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listOfImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let url = URL(string: listOfImages[indexPath.item])
        cell.myImage.sd_setImage(with: url,
            placeholderImage: UIImage(systemName: "photo"),
            options: [.progressiveLoad, .retryFailed]
        )
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.myImage.contentMode = .scaleAspectFill
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
