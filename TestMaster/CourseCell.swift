//
//  CourseCell.swift
//  TestMaster
//
//  Created by Matt Luedke on 3/28/16.
//
//

import Foundation
import UIKit

class CourseCell: UICollectionViewCell {
  
  static let reuseIdentifier = "courseCell"
  
  let titleLabel = UILabel()
  let nameLabel = UILabel()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor(red: 0.0, green: 128/255.0, blue: 0.0, alpha: 0.25)
    
    titleLabel.font = UIFont(name: "Avenir Heavy", size: 17.0)
    titleLabel.numberOfLines = 0
    titleLabel.textAlignment = .Center
    titleLabel.textColor = .blackColor()
    addSubview(titleLabel)
    titleLabel.snp_makeConstraints { make in
      make.top.equalTo(self)
      make.leading.equalTo(self).offset(10)
      make.trailing.equalTo(self).offset(-10)
      make.height.equalTo(self).dividedBy(2)
    }
    
    let instructorLabel = UILabel()
    instructorLabel.font = UIFont(name: "Avenir Light", size: 14.0)
    instructorLabel.textAlignment = .Center
    instructorLabel.textColor = .blackColor()
    instructorLabel.text = "Instructor:"
    addSubview(instructorLabel)
    instructorLabel.snp_makeConstraints { make in
      make.top.equalTo(titleLabel.snp_bottom)
      make.height.equalTo(self).dividedBy(4)
      make.left.equalTo(self)
      make.right.equalTo(self)
    }
    
    nameLabel.font = UIFont(name: "Avenir Black Oblique", size: 17.0)
    nameLabel.textAlignment = .Center
    nameLabel.textColor = .blackColor()
    addSubview(nameLabel)
    nameLabel.snp_makeConstraints { make in
      make.top.equalTo(instructorLabel.snp_bottom)
      make.left.equalTo(self)
      make.right.equalTo(self)
      make.bottom.equalTo(self)
    }
  }
}
