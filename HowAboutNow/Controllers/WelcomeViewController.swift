//
//  WelcomeViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 04/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController,UIScrollViewDelegate, UIPageViewControllerDelegate {
    
    @IBOutlet weak var lblHedings: UILabel!
    @IBOutlet weak var pageNumbers: UIPageControl!
    @IBOutlet var sliderCollectionView: UICollectionView!
    
    var offSet: CGFloat = 0
    var timer = Timer()
    var visibleIndexPath: IndexPath? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.offSet = 0
        pageNumbers.numberOfPages = welcomeHeading.count
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(slider), userInfo: nil, repeats: true)
    }
    @objc func slider(){
        let cells = sliderCollectionView.visibleCells
        for cell in  cells {
            if let index = sliderCollectionView.indexPath(for: cell){
                if index.row == welcomeHeading.count - 1{
                }else{
                    sliderCollectionView.scrollToItem(at: IndexPath(item: index.row + 1, section: 0), at: .centeredHorizontally, animated: true)
                    pageNumbers.currentPage = index.row + 1
                   // index.row + 1 == 4 ? self.nextbutton() : self.skipButton()
                }
            }
        }
    }
    //MARK: UIScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: sliderCollectionView.contentOffset, size: sliderCollectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let index = sliderCollectionView.indexPathForItem(at: visiblePoint)
        {
            print(index.row)
            self.pageNumbers.currentPage = Int(index.row)
            
        }
    }
}
extension WelcomeViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welcomeHeading.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! firstViewCell
        lblHedings.text = welcomeHeading[indexPath.row]
        cell.imageView.image = welcomeImage[indexPath.row]
        return cell
    }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
       cell.contentView.alpha = 0.3
       cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        // Simple Animation
        UIView.animate(withDuration: 0.5) {
            cell.contentView.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
        
    }
    
}
class firstViewCell : UICollectionViewCell{
    @IBOutlet var imageView: UIImageView!
    
}

