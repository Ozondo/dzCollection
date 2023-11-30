//
//  ViewController.swift
//  dz4Colletion
//
//  Created by Егор Иванов on 29.11.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    // MARK: - private properties
    
    let modelUpdate: [infoUpdate] = [
        .init(id: "1", name: "Slippery Stair", status: "Alive", species: "Mythological Creature", gender: "Male", image: UIImage(named: "Slippery Stair")!),
        .init(id: "2", name: "Slippery Stair", status: "Unkown", species: "Humanoid", gender: "Male", image: UIImage(named: "Mr. Meeseeks")!),
        .init(id: "3", name: "Vampire Master", status: "Alive", species: "Mythological Creature", gender: "Male", image: UIImage(named: "Vampire Master")!),
        .init(id: "4", name: "Rick’s Disguise", status: "Alive", species: "Human", gender: "Male", image: UIImage(named: "Rick’s Disguise")!),
        .init(id: "5", name: "Young Beth", status: "Unknown", species: "Human", gender: "Female", image: UIImage(named: "Young Beth")!)
    ]
    
    private let colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()
    
    private enum Const {
        static let trailingConst: CGFloat = -10
        static let leadingConst: CGFloat = 10
        static let hightConst: CGFloat = 100
    }
    
    // MARK: - init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(colletionView)
        setupCollection()
        constraints()
    }
    // MARK: - Collection
    private func setupCollection(){
        colletionView.delegate = self
        colletionView.dataSource = self
        colletionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        colletionView.backgroundColor = .black

    }
    // MARK: - layout
    private func constraints(){
        
        [colletionView].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        NSLayoutConstraint.activate([
            colletionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colletionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colletionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Const.leadingConst),
            colletionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Const.trailingConst)
        ])
    }

}
    // MARK: - Delegate
extension ViewController: UICollectionViewDelegate {
    
}
    // MARK: - DataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelUpdate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.contentView.layer.cornerRadius = 25
        
        let data = modelUpdate[indexPath.item]
        
        cell.updateInfo(data)
        
        return cell
    }
}
    // MARK: - DelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: colletionView.bounds.width, height: Const.hightConst)
    }
}
