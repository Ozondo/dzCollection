//
//  CollectionViewCell.swift
//  dz4Colletion
//
//  Created by Егор Иванов on 29.11.2023.

import UIKit


struct infoUpdate {
    var id: String
    var name: String
    var status: String
    var species: String
    var gender: String
    var image: UIImage
}

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - private properties
    
    
    
    private let image = UIImageView()
    
    private let id: UILabel = {
        let text = UILabel()
        text.text = "id"
        return text
    }()
    
    private let name: UILabel = {
        let text = UILabel()
        text.text = "name"
        return text
    }()
    
    private let status: UILabel = {
        let text = UILabel()
        text.text = "status"
        return text
    }()
    
    private let species: UILabel = {
        let text = UILabel()
        text.text = "species"
        return text
    }()
    
    private let gender: UILabel = {
        let text = UILabel()
        text.text = "gender"
        return text
    }()

    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        addSub()
        constrains()
        image.contentMode = .scaleAspectFit
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - addSubviews
    private func addSub(){
        [id,name,status,species,gender,image].forEach({ element in
            contentView.addSubview(element)
        })
    }
    
    // MARK: - layout
    private func constrains(){
        
        [id,name,status,species,gender,image].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 70),
            
            
            id.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            id.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            id.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            
            name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            name.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            
            species.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            species.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            
            
            gender.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            gender.topAnchor.constraint(equalTo: species.bottomAnchor, constant: 10),
            
            
            status.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            status.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

}

extension CollectionViewCell {
    func updateInfo(_ model: infoUpdate){
        id.text = model.id
        name.text = model.name
        species.text = model.species
        gender.text = model.gender
        status.text = model.status
        image.image = model.image
    }
}
