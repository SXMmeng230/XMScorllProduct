//
//  XMScorllView.swift
//  XMScorllPictureProduct
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import UIKit


class XMScorllView: UIView {

    @IBOutlet var pageConrol: UIPageControl!
    @IBOutlet var collectionView: UICollectionView!
    var timer:NSTimer?
    var scorllArray :[AnyObject] = []{
        willSet{
            if newValue.count == 1{
               pageConrol.hidden = true
                collectionView.scrollEnabled = false
            }else {
              pageConrol.hidden = false
                collectionView.scrollEnabled = true
                pageConrol.numberOfPages = newValue.count
                if timer == nil{
                   self.addStartTimer()
                }
                collectionView.reloadData()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: "XMScrollCollectionCell", bundle: nil), forCellWithReuseIdentifier: "scrollCell")
    }
    //MARK: - 开始定时器
    func addStartTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector:"addTimer:", userInfo: nil, repeats: true)
    }
    
    func addTimer(tim:NSTimer){
       self.nextPage()
    }
    //MARK: - 结束定时器
    func endTimer(){
        self.timer?.invalidate()
        self.timer = nil
    }
    //MARK:- 轮播下一页
    func nextPage(){
        let visiablePath:NSIndexPath? = collectionView.indexPathsForVisibleItems().first
        if visiablePath == nil{
           return
        }
        var visiableItem = visiablePath!.item
        if (visiablePath!.item % scorllArray.count) == 0 {
           collectionView.scrollToItemAtIndexPath(NSIndexPath.init(forItem: kCenterRows(scorllArray), inSection: 0), atScrollPosition: .Left, animated: false)
            visiableItem = kCenterRows(scorllArray)
        }
        let nextItem = visiableItem + 1
        collectionView.scrollToItemAtIndexPath(NSIndexPath.init(forItem: nextItem, inSection: 0), atScrollPosition: .Left, animated: true)
    }
        /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
extension XMScorllView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kTotalRowsInSection(scorllArray)
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("scrollCell", forIndexPath: indexPath) as! XMScrollCollectionCell
        cell.object = scorllArray[indexPath.item % scorllArray.count] as! XMScrollObject
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
    
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(collectionView.bounds.width, collectionView.bounds.height)
    }
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let visiablePath:NSIndexPath? = collectionView.indexPathsForVisibleItems().first
        if visiablePath == nil{
        return
        }
        pageConrol.currentPage = visiablePath!.item % scorllArray.count
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.endTimer()
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.addStartTimer()
    }

}
