//
//  ViewController.swift
//  TestAssignment
//
//  Created by VishalP on 11/04/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK:- UI Compenents
    fileprivate let cellId = "cellId"
    fileprivate lazy var tableInfoList: UITableView = {
       let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        return tb
    }()

    var activity = UIActivityIndicatorView()
    
    //MARK:- Data Variables
    var arrayInfoList = ["a", "b", "c", "d"]
    var fetchError: Error?
    var updateTable = false
    
    //MARK:- View Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        //arrayInfoList = ["a", "b", "c", "d"]
        setUpUIForViews()
    }
    
    //MARK:- Set UI for views
    func setUpUIForViews() -> Void {
//        let refresh = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(fetchDataFromAPI))
//        self.navigationItem.rightBarButtonItem  = refresh
    
        view.backgroundColor = .white
        view.addSubview(tableInfoList)
        
        let views = ["table":self.tableInfoList]

        var constraints =  NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[table]-0-|", options: NSLayoutConstraint.FormatOptions.alignAllTop, metrics: nil, views: views)
        self.view.addConstraints(constraints)

        let stringConstraint = "V:|-0-[table]-0-|"

        constraints =  NSLayoutConstraint.constraints(withVisualFormat: stringConstraint, options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        self.view.addConstraints(constraints)
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableInfoList.dequeueReusableCell(withIdentifier: cellId) 
        let obj = arrayInfoList[indexPath.row]
        cell?.textLabel?.text = obj
        cell?.textLabel?.textColor = .black
        return cell!
    }
    
}
