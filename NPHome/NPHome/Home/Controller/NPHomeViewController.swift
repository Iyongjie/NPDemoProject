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
import SnapKit
import SwiftTheme

public class NPHomeViewController: NPBaseViewController {
    
    let dataHandler = NPHomeDataHandle()
    var results = [NPHomeCourseLayout]()
    let navigator: NavigatorType

    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(NPHomeCourseTableViewCell.self, forCellReuseIdentifier: "cellid")
        table.mj_header = NPRefreshHeader(refreshingBlock: {
            print("123123")
        })
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
            // 数据回调
            self?.results = NPHomeCourseLayout.initWithModels(models: results)
            self?.tableView.reloadData()
        }
    }
    
    func configUI() {
        addNavigationBar()
        self.contentView.addSubview(self.tableView)
    }

}

extension NPHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! NPHomeCourseTableViewCell
        let layout = results[indexPath.row]
        cell.textLabel?.text = layout.title
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
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.tableView.snp.makeConstraints {(make) in
            make.left.top.right.bottom.equalTo(0)
        }
         
    }
}
