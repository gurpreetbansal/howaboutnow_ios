//
//  NearByViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 12/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit

class NearByViewController: UIViewController {

    @IBOutlet weak var upperCol: UICollectionView!
    @IBOutlet weak var lowerCol: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NearBy"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NearByViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upperCol{
            return 20
        }else{
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upperCol{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nearByCollectionCell", for: indexPath) as? nearByCollectionCell{
                return cell
            }
        }else{
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nearByCollectionCell2", for: indexPath) as? nearByCollectionCell2{
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == upperCol{
            return CGSize(width: 100, height:140)
        }else{
            return CGSize(width: (collectionView.frame.size.width / 2) - 10, height:300)
        }
    }
  
}
class nearByCollectionCell :UICollectionViewCell{
  
    
}
class nearByCollectionCell2: UICollectionViewCell {
    
}

