//
//  GameViewModel.swift
//  DYZB
//
//  Created by 1 on 16/10/8.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games : [GameModel] = [GameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallback : @escaping () -> ()) {
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            // 1.获取到数据
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            // 2.字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            
            // 3.完成回调
            finishedCallback()
        }
    }
}
