//
//  NPHomeDataHandle.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/31.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit
import RxSwift

typealias NPHomeDataBlock = (_ results: [NPHomeCarModel]) -> ()

class NPHomeDataHandle: NSObject {
    
    let disposeBag = DisposeBag()
    
    func requestHomeData(block: @escaping NPHomeDataBlock) {
        
        var param: Dictionary = [String: String]()
        param.updateValue("", forKey: "userId")
        
        let url = "v1/shopCourse/listCategory"
        
        API.getRequestParamerDicApi(param, url).request().asObservable().mapResponseToObjectArray(type: NPHomeCarModel.self).subscribe(onNext: { (result) in
            block(result)
        }, onError: { (error) in

        }, onCompleted: {
            print("完成")
        }, onDisposed:  {
            print("释放了")
        }).disposed(by: disposeBag)
    }
}
