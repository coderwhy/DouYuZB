//
//  RecommendGameView.swift
//  DYZB
//
//  Created by 1 on 16/9/21.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
private let kEdgeInsetMargin : CGFloat = 10

class RecommendGameView: UIView {
    
    // MARK: 定义数据的属性
    var groups : [AnchorGroup]? {
        didSet {
            // 1.移除前两组数据
            groups?.removeFirst()
            groups?.removeFirst()
            
            // 2.添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            // 2.刷新表格
            collectionView.reloadData()
        }
    }
    
    // MARK: 控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: 系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 让控件不随着父控件的拉伸而拉伸
        autoresizingMask = .None
        
        // 注册Cell
        collectionView.registerNib(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        // 给collectionView添加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: kEdgeInsetMargin, bottom: 0, right: kEdgeInsetMargin)
    }
}


// MARK:- 提供快速创建的类方法
extension RecommendGameView {
    class func recommendGameView() -> RecommendGameView {
        return NSBundle.mainBundle().loadNibNamed("RecommendGameView", owner: nil, options: nil).first as! RecommendGameView
    }
}


// MARK:- 遵守UICollectionView的数据源协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kGameCellID, forIndexPath: indexPath) as! CollectionGameCell
        
        cell.group = groups![indexPath.item]
        
        return cell
    }
}