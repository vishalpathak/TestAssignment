//
//  DataInfoViewModel.swift
//  TestAssignment
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation

struct DataInfoViewModel {
    let title: String
    let description: String
    let imageInfo: String
    
    //Dependency Injection DI
    init(dataInfo: RowInfo) {
        self.title = dataInfo.title ?? DefaultStrings.DefaultTitle
        self.description = dataInfo.description ?? DefaultStrings.DefaultDescription
        self.imageInfo = dataInfo.imageHref ?? ""
    }
}
