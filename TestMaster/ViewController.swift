//
//  ViewController.swift
//  TestMaster
//
//  Created by Matt Luedke on 3/27/16.
//
//

import UIKit

typealias Course = (title: String, instructor: String)

class ViewController: UIViewController {

  var courses = [Course]()
  
  override func loadView() {
    let mainView = MainView(frame: UIScreen.mainScreen().bounds)
    mainView.collectionView.registerClass(CourseCell.self, forCellWithReuseIdentifier: CourseCell.reuseIdentifier)
    mainView.collectionView.dataSource = self
    view = mainView
  }
  
  func mainView() -> MainView {
    return self.view as! MainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let path = NSBundle.mainBundle().pathForResource("MyWishlist", ofType: "plist"),
      array = NSArray(contentsOfFile: path) as? [[String: String]] {
        
        courses = array.map { dict -> Course in
          return (title: dict["title"]!, instructor: dict["instructor"]!)
        }
    }
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return courses.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CourseCell.reuseIdentifier, forIndexPath: indexPath) as! CourseCell
    cell.titleLabel.text = courses[indexPath.row].title
    cell.nameLabel.text = courses[indexPath.row].instructor
    return cell
  }
}
