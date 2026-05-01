//
//  ViewController.swift
//  lab11
//
//  Created by Nemo on 01/05/2026.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let topSectionImages = ["1.png", "1.png", "1.png"]
    let topSectionTitles = ["In My Shadow", "Creative Journey", "New Adventures"]

    let bottomSectionItems = [
        (title: "Zooba: Zoo Battle", sub: "10-minute survival shooter", icon: "1.png"),
        (title: "Clash Royale", sub: "Epic real-time strategy", icon: "1.png"),
        (title: "Brawl Stars", sub: "Fast-paced 3v3 multiplayer", icon: "1.png"),
        (title: "Subway Surfers", sub: "Run and dodge trains", icon: "1.png"),
        (title: "Among Us", sub: "Space teamwork and betrayal", icon: "1.png"),
        (title: "PUBG Mobile", sub: "The original battle royale", icon: "1.png"),
        (title: "Clash Royale", sub: "Epic real-time strategy", icon: "1.png"),
        (title: "Brawl Stars", sub: "Fast-paced 3v3 multiplayer", icon: "1.png"),
        (title: "Subway Surfers", sub: "Run and dodge trains", icon: "1.png"),
        (title: "Among Us", sub: "Space teamwork and betrayal", icon: "1.png"),
        (title: "PUBG Mobile", sub: "The original battle royale", icon: "1.png")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.collectionViewLayout = createCompositionalLayout()
    }

    private func createCompositionalLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                return self.createTopSection()
            } else {
                return self.createBottomSection()
            }
        }
    }
    private func createTopSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0)
        return section
    }

    private func createBottomSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(85))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(85))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 20, trailing: 16)
        return section
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? topSectionTitles.count : bottomSectionItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topCell", for: indexPath) as! TopCollectionViewCell
            cell.myLable1.text = topSectionTitles[indexPath.item]
            cell.myImage.image = UIImage(named: topSectionImages[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! BottomCollectionViewCell
            let item = bottomSectionItems[indexPath.item]
            cell.myLable1.text = item.title
            cell.myLable2.text = item.sub
            cell.myImage.image = UIImage(named: item.icon)
            return cell
        }
    }
}

