//
//  NPMineViewController.swift
//  NPMine
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit
import URLNavigator
import SnapKit
import FWPopupView
import Kingfisher

public class NPMineViewController: NPBaseViewController {
    
    let navigator: NavigatorType
     
    lazy var testImageView: UIImageView = {
        let imageView = UIImageView()
        let imageUrl = URL(string: "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3404129581,3734062752&fm=26&gp=0.jpg")
        imageView.kf.setImage(with: imageUrl)
        return imageView
    }()
    
    lazy var goodInfoPopupView: NPGoodInfoPopupView = {
        let customPopupView = NPGoodInfoPopupView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
        
        let vProperty = FWPopupViewProperty()
        vProperty.popupCustomAlignment = .bottomCenter
        vProperty.popupAnimationType = .position
        vProperty.maskViewColor = UIColor(white: 0, alpha: 0.5)
        vProperty.touchWildToHide = "1"
        vProperty.popupViewEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        vProperty.animationDuration = 0.2
        vProperty.usingSpringWithDamping = 0.6
        customPopupView.vProperty = vProperty
        return customPopupView
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

        configUI()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func configUI()  {
        self.contentView.addSubview(self.testImageView)
        // 不规则按钮
        let addBtn = NPShapeImageButton(type: .custom)
        addBtn.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
        addBtn.setImage(UIImage(named: "add_cart_clear.jpg"), for: .normal)
        addBtn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        self.contentView.addSubview(addBtn)
        addBtn.clickDurationTime = 0.1
        
        let buyBtn = NPShapeImageButton(type: .custom)
        buyBtn.frame = CGRect(x: 135, y: 300, width: 100, height: 50)
        buyBtn.setImage(UIImage(named: "now_buy_clear.jpg"), for: .normal)
        buyBtn.addTarget(self, action: #selector(buyAction(sender:)), for: .touchUpInside)
        self.contentView.addSubview(buyBtn)
    }
    
    @objc func addAction() {
        print("添加购物车")
        goodInfoPopupView.show()
    }
    @objc func buyAction(sender: UIButton) {
        print("立即购买")
        let customPopupView = NPPayPopupView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
        
        let vProperty = FWPopupViewProperty()
        vProperty.popupCustomAlignment = .bottomCenter
        vProperty.popupAnimationType = .position
        vProperty.maskViewColor = UIColor(white: 0, alpha: 0.5)
        vProperty.touchWildToHide = "1"
        vProperty.popupViewEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        vProperty.animationDuration = 0.2
        vProperty.usingSpringWithDamping = 0.6
        customPopupView.vProperty = vProperty
        
        customPopupView.show()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.testImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(200)
            make.width.equalTo(45)
            make.height.equalTo(45)
        }
    }
    
    @objc func testClick() {
        print("11111111")
    }
}
