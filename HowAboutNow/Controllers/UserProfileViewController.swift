//
//  UserProfileViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 12/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit
import SDWebImage
class UserProfileViewController: UIViewController {
    @IBOutlet weak var CardImageTopSpace: NSLayoutConstraint!
    @IBOutlet weak var designableViewTopSpace: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        if screenHeight >= 812{
            self.CardImageTopSpace.constant = -44
            designableViewTopSpace.constant = 82
        }else{
            self.CardImageTopSpace.constant = -24
            designableViewTopSpace.constant = 42
        }

    }
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.performPushSeguefromController(identifier: "TabBarController")
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
extension UserProfileViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileMenu.count
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileTableCell", for: indexPath) as? UserProfileTableCell{
            cell.titleName.text = profileMenu[indexPath.row]
            cell.userProfileCollectionView.delegate = self
            cell.userProfileCollectionView.dataSource = self
            cell.userProfileCollectionView.reloadData()
            return cell
        }
        
        return UITableViewCell()
    }

}

extension UserProfileViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileMenuImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCollectionCell", for: indexPath) as? UserProfileCollectionCell{
            cell.menuImage.image = profileMenuImages[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 4), height:100)
    }
  
}
class UserProfileCollectionCell :UICollectionViewCell{
    @IBOutlet weak var menuImage: UIImageView!
    
}
class UserProfileTableCell: UITableViewCell {
    @IBOutlet weak var userProfileCollectionView: UICollectionView!
    @IBOutlet weak var titleName: UILabel!
    
}

