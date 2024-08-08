//
//  TableViewCell.swift
//  TableViewPractice
//
//  Created by Sonun on 22/9/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var avatar: UIImageView = {
        let ava = UIImageView()
        ava.layer.cornerRadius = 40
        ava.clipsToBounds = true
        ava.translatesAutoresizingMaskIntoConstraints = false
        return ava
    }()
    
    private var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(avatar)
        contentView.addSubview(nameLabel)
                
         NSLayoutConstraint.activate([
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatar.widthAnchor.constraint(equalToConstant: 80),
            avatar.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 12)
            ])
    }
    
    func setData(data: Result ) {
        avatar.getImage(from: data.image)
        nameLabel.text  = data.name
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
