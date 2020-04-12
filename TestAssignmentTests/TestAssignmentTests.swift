//
//  TestAssignmentTests.swift
//  TestAssignmentTests
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import XCTest
import Kingfisher
@testable import TestAssignment

class TestAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

      //MARK:- Unit test For testing DataInfoViewModel
        func testDataInfoModel() {
           
            //Model Object for passing test case
            //let objRowInfo = RowInfo(title: "Toronto", description: "The city of Canada", imageHref: "http://www.image")
            
            //Model Object for failing test case
            let objRowInfo = RowInfo(title: "Toronto", description: nil, imageHref: "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg")
            let objViewModel = DataInfoViewModel(dataInfo: objRowInfo)
            
            XCTAssertEqual(objRowInfo.title, objViewModel.title)
            XCTAssertEqual(objRowInfo.description, objViewModel.description)
            XCTAssertEqual(objRowInfo.imageHref, objViewModel.imageInfo)
        }
        
        //MARK:- Unit Test For API data fecth call
        func testApiDataFetch() {
            //let str = "About" // Result for Failing Test Case
            let str = "About Canada" // Result for passing Test Case
           
            let expectation = self.expectation(description: str)
            
            NetworkApiManager.sharedNetworkApiManager.getDataFromUrl(BaseUrlPath) { (dt: DataInfo?, err: Error?) in
                if let error = err{
                    XCTFail("Failed with error\(error.localizedDescription)")
                }
                if let data = dt{
                    if data.title == str{
                        expectation.fulfill()
                    }else{
                        XCTFail("Failed with data is not equal")
                    }
                }
            }
            
            self.waitForExpectations(timeout: 10, handler: nil)
        }
        
        //MARK:- For testing success and fail Image loading
        func testImageFromUrl(){
            
            let imageInfo = UIImageView()
            let expectation = self.expectation(description: CommonText.CommonImageInfo)
            
            var strImage: String?
            
            //Success Link for Image
             strImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
            
            //Error Link for Image
            // strImage = "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"
            
            //No Link
            //strImage = nil
            
            guard let strLink = strImage else { return }
            guard let url = URL(string: strLink) else { return }
            let resource = ImageResource(downloadURL: url, cacheKey: strLink)
            imageInfo.kf.setImage(with: resource, placeholder: UIImage(named: "placeholder_image"), options: nil, progressBlock: nil) { (result) in
                switch result{
                case .success( _):
                    expectation.fulfill()
                case .failure( _):
                    XCTFail("Failed with image data not available")
                }
            }
            self.waitForExpectations(timeout: 10, handler: nil)
        }
    
}
