//
//  MainView.swift
//  TestMaster
//
//  Created by Matt Luedke on 3/28/16.
//
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
  
  var collectionView: UICollectionView!
  private let titleLabel = UILabel()
  
  required init(coder aDecoder: NSCoder) {
    fatalError("This class does not support NSCoding")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .whiteColor()

    titleLabel.text = "My Course Wishlist"
    titleLabel.textAlignment = .Center
    addSubview(titleLabel)
    titleLabel.snp_makeConstraints { make in
      make.top.equalTo(self).offset(25)
      make.centerX.equalTo(self)
      make.height.equalTo(40)
      make.width.equalTo(200)
    }
    
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 150, height: 150)
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .whiteColor()
    addSubview(collectionView)
    collectionView.snp_makeConstraints { make in
      make.top.equalTo(titleLabel.snp_bottom).offset(25)
      make.left.equalTo(self)
      make.right.equalTo(self)
      make.bottom.equalTo(self)
    }
  }
  
  func updateTitle(newTitle: String) {
    titleLabel.text = newTitle
  }
  
  func getTitle() -> String? {
    return titleLabel.text
  }
}
