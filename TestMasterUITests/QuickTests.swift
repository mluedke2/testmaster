//
//  QuickTests.swift
//  TestMaster
//
//  Created by Matt Luedke on 4/6/16.
//
//

@testable import TestMaster
import XCTest
import Quick
import Nimble

class QuickTests: QuickSpec {
  
  override func spec() {
    
    var viewController: ViewController!
    
    describe("the main view controller") {
      
      beforeEach {
        viewController = ViewController()
        UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
        let _ = viewController.view
      }
      
      // UNIT TESTS

      it("is instantiated") {
        expect(viewController).toNot(beNil())
      }
      
      // FUNCTIONAL TESTS
      
      it ("is visible") {
        expect(viewController.view.hidden).to(beFalse())
      }

      it("shows the right number of cells") {
        let courses = [ (title: "Small Business Mr. Management 301", instructor: "Bluth") ]
        viewController.courses = courses
        expect(viewController.mainView().collectionView.numberOfItemsInSection(0)) == courses.count
      }
      
      it("shows the course title and instructor") {
        let course = (title: "Small Business Mr. Management 301", instructor: "Bluth")
        let courses = [ course ]
        viewController.courses = courses
        viewController.mainView().collectionView.layoutIfNeeded()
        let cell = viewController.mainView().collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0)) as! CourseCell
        
        expect(cell.titleLabel.text) == course.title
        expect(cell.nameLabel.text) == course.instructor
      }
    }
  }
}
