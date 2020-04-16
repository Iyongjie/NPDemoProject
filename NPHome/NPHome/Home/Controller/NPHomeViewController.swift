//
//  NPHomeViewController.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit
import CYLTabBarController
import URLNavigator

public class NPHomeViewController: UIViewController {
    
    let dataHandler = NPHomeDataHandle()
    var results = [NPHomeCarModel]()
    let navigator: NavigatorType

    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        return table
    }()
    
    public init(navigator: NavigatorType) {
      self.navigator = navigator
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
        
        configUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func requestData() {
        dataHandler.requestHomeData { [weak self] (results) in
            self?.results = results
            self?.tableView.reloadData()
        }
    }
    
    func configUI() {
        self.view.backgroundColor = kAppMainColor
        self.view.addSubview(self.tableView)
    }
     
    @objc func homeToMine() {
        
    }
}

extension NPHomeViewController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let model = results[indexPath.row]
        cell.textLabel?.text = model.categoryName
        cell.detailTextLabel?.text = model.createdAt
        return cell
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var name = "\(indexPath.row)"
        if indexPath.row == 0 {
            name = "navigator://mine/\(name)"
        } else if indexPath.row == 1 {
            name = "navigator://alert?title=Hello&message=World"
        } else {
            name = "navigator://123"
        }
        let isPushed = self.navigator.push(name) != nil
        if isPushed {
            print("[Navigator] push: \(name)")
        } else {
            print("[Navigator] open: \(name)")
            self.navigator.open(name)
        }
    }
}
