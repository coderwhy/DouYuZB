//
//  FunnyViewModel.swift
//  DYZB
//
//  Created by 1 on 16/10/14.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData: false, URLString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameters: ["limit" : 30, "offset" : 0], finishedCallback: finishedCallback)
    }
}
