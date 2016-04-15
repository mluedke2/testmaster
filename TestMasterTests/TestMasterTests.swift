//
//  TestMasterTests.swift
//  TestMasterTests
//
//  Created by Matt Luedke on 3/27/16.
//
//

import XCTest
@testable import TestMaster

class TestMasterTests: XCTestCase {
  
  var viewController: ViewController!
  
  override func setUp() {
    super.setUp()
    
    viewController = ViewController()
    UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
    let _ = viewController.view
  }

  // UNIT TEST
  
  func testInitialization() {
    XCTAssertNotNil(viewController)
  }
  
  // FUNCTIONAL TESTS
  
  func testScreenVisible() {
    XCTAssertFalse(viewController.view.hidden)
  }
  
  func testCellCount() {
    let course = (title: "Small Business Mr. Management 301", instructor: "Bluth")
    let courses = [ course ]
    viewController.courses = courses
    XCTAssertEqual(courses.count, viewController.mainView().collectionView.numberOfItemsInSection(0))
  }

  func testCellData() {
    let course = (title: "Small Business Mr. Management 301", instructor: "Bluth")
    let courses = [ course ]
    viewController.courses = courses
    viewController.mainView().collectionView.layoutIfNeeded()
    let cell = viewController.mainView().collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0)) as! CourseCell

    XCTAssertEqual(cell.titleLabel.text, course.title)
    XCTAssertEqual(cell.nameLabel.text, course.instructor)
  }
}
