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

protocol DataReceivedDelegate: class {
    func didGetDataFromAPI(rowViewModel: [DataInfoViewModel]?, titleText: String?, error: Error?)
}

class DataInfoVM {
    weak var dataReceivedDelegate: DataReceivedDelegate?
    
    func fetchDataFromApi(urlAPI: String){
        NetworkApiManager.sharedNetworkApiManager.getDataFromUrl(urlAPI) { (dt: DataInfo?, err: Error?) in
            if let error = err{
                self.dataReceivedDelegate?.didGetDataFromAPI(rowViewModel: nil, titleText: nil, error: error)
                return
            }
            if let data = dt{
                //Map DataModel Object to DataViewModel object
                let arrayViewModel = data.rows.map({ (rowObj: RowInfo) -> DataInfoViewModel in
                    return DataInfoViewModel(dataInfo: rowObj)
                })
                self.dataReceivedDelegate?.didGetDataFromAPI(rowViewModel: arrayViewModel, titleText: data.title, error: nil)
            }
        }
    }
}
