//
//  HomeInfoTableViewCell.swift
//  TestAssignment
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import UIKit
import Kingfisher

class HomeInfoTableViewCell: UITableViewCell {
    //MARK:- UI Compenents
       fileprivate let titleLable: UILabel = {
           let title = UILabel()
           title.translatesAutoresizingMaskIntoConstraints = false
           title.textColor = .black
           title.numberOfLines = 0
           title.font = UIFont.boldSystemFont(ofSize: 20.0)
           return title
       }()
       
       fileprivate let descriptionLabel: UILabel = {
          let description = UILabel()
           description.translatesAutoresizingMaskIntoConstraints = false
           description.textColor = .black
           description.numberOfLines = 0
           return description
       }()
       
       fileprivate var infoImage: UIImageView? = {
          let img = UIImageView()
           img.translatesAutoresizingMaskIntoConstraints = false
           img.contentMode = .scaleAspectFit
           return img
       }()
       
       fileprivate let imageInfoLabel: UILabel = {
          let imgLabel = UILabel()
           imgLabel.translatesAutoresizingMaskIntoConstraints = false
           imgLabel.textColor = .black
           imgLabel.numberOfLines = 0
           imgLabel.font = UIFont.italicSystemFont(ofSize: 12.0)
           imgLabel.textAlignment = .center
           return imgLabel
       }()
       
     //MARK:- ViewModel Object set data to UI object using ViewModel
    var dataInfoModel: DataInfoViewModel? {
        didSet{
            titleLable.text = "\(CommonText.CommonTitle) \(dataInfoModel?.title ?? DefaultStrings.DefaultTitle)"
            descriptionLabel.text = "\(CommonText.CommonDescription) \(dataInfoModel?.description ?? DefaultStrings.DefaultDescription)"
            
            if let imageInfo = self.infoImage{
                guard let str = dataInfoModel?.imageInfo else {return}
                guard let url = URL(string: str) else {
                    imageInfo.image = nil
                    imageInfoLabel.text = "\(DefaultStrings.DefaultImageNotAvailable)"
                    return
                }
                imageInfo.kf.indicatorType = .activity
                let resource = ImageResource(downloadURL: url, cacheKey: dataInfoModel?.imageInfo ?? "")
                imageInfo.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder_image"), options: nil, progressBlock: nil) { (result) in
                    switch result{
                    case .success( _):
                        self.imageInfoLabel.text = "\(CommonText.CommonImageInfo)"
                    case .failure( _):
                        self.imageInfoLabel.text = "\(DefaultStrings.DefaultImageNotAvailable)"
                    }
                }
            }
        }
    }
    //MARK:- Table View Cell UI added
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLable)
        addSubview(descriptionLabel)
        if let imgView = infoImage{
            addSubview(imgView)
        }
        addSubview(imageInfoLabel)
        setUpAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- AutoLayout Setup
    private func setUpAutoLayOut() {
        
        let constraints = [titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                           titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           
                           descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 16),
                           descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           
                           infoImage!.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                           infoImage!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           infoImage!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                           imageInfoLabel.topAnchor.constraint(equalTo: infoImage!.bottomAnchor, constant: 16),
                           imageInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           imageInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           imageInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
