//
//  SettingsViewController.swift
//  HowAboutNow
//
//  Created by iMarkPC on 04/03/20.
//  Copyright © 2020 iMark. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
        return settingTitles[0].count
        } else if section == 1 {
            return settingTitles[1].count
        } else if section == 2 {
            return settingTitles[2].count
        } else if section == 3 {
            return settingTitles[3].count
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.clear
        return vw
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? settingCell{
            switch indexPath.section {
            case 0:
                cell.nameLbl.text = settingTitles[0][indexPath.row]
                cell.viewline.isHidden = true
                cell.titleleadingSpace.constant = 20
                cell.nameLbl.textColor = UIColor.darkGray
            case 1:
                cell.nameLbl.text = settingTitles[1][indexPath.row]
                cell.viewline.isHidden = false
                cell.titleleadingSpace.constant = 20
                cell.nameLbl.textColor = UIColor.darkGray
            case 2:
                cell.nameLbl.text = settingTitles[2][indexPath.row]
                cell.viewline.isHidden = false
                cell.titleleadingSpace.constant = 20
                cell.nameLbl.textColor = UIColor.darkGray
            case 3:
                cell.nameLbl.text = settingTitles[3][indexPath.row]
                cell.viewline.isHidden = true
                cell.titleleadingSpace.constant = cell.mainView.frame.width / 2 - 20
                cell.nameLbl.textColor = ORANGE_FONT_COLOR
            default:
                cell.nameLbl.text = ""
                cell.viewline.isHidden = true
                cell.titleleadingSpace.constant = 20
                cell.nameLbl.textColor = UIColor.darkGray
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.performPushSeguefromController(identifier: "FilterViewController") 
        case 1:
            if settingTitles[indexPath.section][indexPath.row] == "Notifications" {
                self.performPushSeguefromController(identifier: "NotificationViewController")
            }else if settingTitles[indexPath.section][indexPath.row] == "Language" {
                self.performPushSeguefromController(identifier: "NearByViewController")
            }
        case 2: break
            
        case 3: break
            
        default: break
            
        }
    }
    
}
class settingCell:UITableViewCell{
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleleadingSpace: NSLayoutConstraint!
    @IBOutlet weak var viewline: UIView!
    @IBOutlet weak var nameLbl: UILabel!
}
