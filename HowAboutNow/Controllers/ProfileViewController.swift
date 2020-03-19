//
//  ProfileViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 04/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
extension ProfileViewController:UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else if section == 1{
            return 1
        } else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell1", for: indexPath) as? ProfileTableCell1{
                cell.profileCollectionView.delegate = self
                cell.profileCollectionView.dataSource = self
                cell.profileCollectionView.reloadData()
                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell2", for: indexPath) as? ProfileTableCell2{
                return cell
            }
        } else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell3", for: indexPath) as? ProfileTableCell3{
                return cell
            }
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else if indexPath.section == 1 {
            return 200
        } else{
            return 180
        }
        
    }
}

extension ProfileViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionCell", for: indexPath) as? ProfileCollectionCell{
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 3), height: 100)
    }
  
}
class ProfileCollectionCell :UICollectionViewCell{
   
}
class ProfileTableCell1: UITableViewCell {
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
}
class ProfileTableCell2: UITableViewCell {
    
}
class ProfileTableCell3: UITableViewCell {
    
}
