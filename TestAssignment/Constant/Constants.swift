//
//  Constants.swift
//  TestAssignment
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation

//Base Url API for fetching data from server
let BaseUrlPath = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

//Http Response codes
struct HttpResponse {
    static let ResponseSuccess = 200
    static let ResponseNotFound = 404
}

struct AlertMessages {
    static let AlertTitle = "Error"
    static let MessageInfo = "Internet is not connected. Please check settings."
    static let ButtonTitle = "OK"
    static let CommonError = "Something went wrong please try after sometime."
}

struct DefaultStrings{
    static let DefaultNavigationTitle = "InfoView"
    static let DefaultTitle = "Sorry! title not available"
    static let DefaultDescription = "Sorry! description not available"
    static let DefaultImageNotAvailable = "Sorry! Image not available."
}

struct CommonText {
    static let CommonTitle = "Title:"
    static let CommonDescription = "Description:"
    static let CommonImageInfo = "Information image:"
}
