//
//  NotificationViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 11/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notifications"
        // Do any additional setup after loading the view.
    }
    


}
extension NotificationViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return notificationTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return notificationTitles[0].count
        } else if section == 1 {
            return notificationTitles[1].count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView()
            headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100)
            headerView.backgroundColor = UIColor.clear
            let label = UILabel()
            label.frame = headerView.frame
            label.text = "Keep notifications enable to be alerted about what's going on in your profile."
            label.textColor = UIColor.darkGray
            label.numberOfLines = 0
            label.textAlignment = .center
            headerView.addSubview(label)
            return headerView
        }else{
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 100
        } else if section == 1 {
            return 30
        } else {
            return 0
        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Keep notifications enable to be alerted about what's going on in your profile."
//        } else if section == 1 {
//            return ""
//        } else {
//            return ""
//        }
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? notificationCell{
            switch indexPath.section {
            case 0:
                cell.nameLbl.text = notificationTitles[0][indexPath.row]
                cell.viewline.isHidden = true
                cell.nameLbl.textColor = UIColor.darkGray
            case 1:
                cell.nameLbl.text = notificationTitles[1][indexPath.row]
                cell.viewline.isHidden = false
                cell.nameLbl.textColor = UIColor.darkGray
            default:
                cell.nameLbl.text = ""
                cell.viewline.isHidden = true
                cell.nameLbl.textColor = UIColor.darkGray
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: break
        case 1: break
            
        default: break
            
        }
    }
    
}
class notificationCell:UITableViewCell{
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewline: UIView!
    @IBOutlet weak var nameLbl: UILabel!
}
