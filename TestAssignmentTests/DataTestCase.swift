//
//  DataTestCase.swift
//  TestAssignmentTests
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation
import XCTest
@testable import TestAssignment

class NewTestData:XCTestCase {
    let str = "About Canada" // Use this for passing Test Case
    //let str = "About" // Use this for Failing Test Case
    
    let obj = DataInfoVM()
    var expe = XCTestExpectation()
    func testAPIData() -> Void {
        expe = self.expectation(description: str)
        obj.dataReceivedDelegate = self
        obj.fetchDataFromApi(urlAPI: BaseUrlPath)
        self.waitForExpectations(timeout: 10, handler: nil)
    }
}
extension NewTestData: DataReceivedDelegate{
    func didGetDataFromAPI(rowViewModel: [DataInfoViewModel]?, titleText: String?, error: Error?) {
        if let error = error{
            XCTFail("Failed with error\(error.localizedDescription)")
        }
        if let data = titleText{
            if data == str{
                expe.fulfill()
            }else{
                XCTFail("Failed with data is not equal")
            }
        }
    }
}
