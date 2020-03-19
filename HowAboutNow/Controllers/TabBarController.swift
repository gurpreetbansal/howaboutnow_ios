//
//  TabBarController.swift
//  KitoPlastic
//
//  Created by apple on 06/05/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class TabBarController: UIViewController{
   
    func addTabBarView(tap: Int) {
        selectedIndex = tap
        buttons[selectedIndex].isSelected = true
        didTapOnBar(buttons[selectedIndex])
    }
    
    @IBOutlet weak var tabbarHeight: NSLayoutConstraint!
    @IBOutlet weak var matches: UIImageView!
    @IBOutlet weak var matcheslbl: UILabel!
    @IBOutlet weak var fav: UIImageView!
    @IBOutlet weak var favLbl: UILabel!
    @IBOutlet weak var discover: UIImageView!
    @IBOutlet weak var discoverlbl: UILabel!
    @IBOutlet weak var settings: UIImageView!
    @IBOutlet weak var settingslbl: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var rightBarBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var FirstViewController = UIViewController()
    var SecondViewController = UIViewController()
    var ThirdViewController = UIViewController()
    var FourthViewController = UIViewController()
    var FivethViewController = UIViewController()
    
    var selectedIndex: Int = 0
    var viewControllers = [UIViewController]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let screenHeight = screenSize.height
        
        if screenHeight >= 812{
            self.tabbarHeight.constant = 83
        }else{
            self.tabbarHeight.constant = 44
        }
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        FirstViewController = storyboard.instantiateViewController(withIdentifier: "MatchesViewController")
        SecondViewController = storyboard.instantiateViewController(withIdentifier: "FavViewController")
        ThirdViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        FourthViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController")
        FivethViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController")
        
        viewControllers = [FirstViewController,SecondViewController,ThirdViewController,FourthViewController,FivethViewController]

        //buttons.reverse()
        //Set the Initial Tab when the App Starts.
        buttons[selectedIndex].isSelected = true
        didTapOnBar(buttons[selectedIndex])
    }
    @IBAction func rightBarBtn(_ sender: UIButton) {
        //performPushSeguefromController(identifier: "NotificationsViewController")
    }
    
    @IBAction func didTapOnBar(_ sender: UIButton) {
        //Get Access to the Previous and Current Tab Button.
        if sender.tag == 0{
            self.title = "Matches"
            
            matches.image = #imageLiteral(resourceName: "match1")
            matcheslbl.textColor = ORANGE_FONT_COLOR
            
            fav.image = #imageLiteral(resourceName: "fav")
            favLbl.textColor = UIColor.lightGray
            
            discover.image = #imageLiteral(resourceName: "discover")
            discoverlbl.textColor = UIColor.lightGray
            
            settings.image = #imageLiteral(resourceName: "setting")
            settingslbl.textColor = UIColor.lightGray
            
            profile.image = #imageLiteral(resourceName: "profile")
            profileLbl.textColor = UIColor.lightGray
            
            
        } else if sender.tag == 1{
            self.title = "Favorites"
            matches.image = #imageLiteral(resourceName: "match")
            matcheslbl.textColor = UIColor.lightGray
            
            fav.image = #imageLiteral(resourceName: "fav1")
            favLbl.textColor = ORANGE_FONT_COLOR
            
            discover.image = #imageLiteral(resourceName: "discover")
            discoverlbl.textColor = UIColor.lightGray
            
            settings.image = #imageLiteral(resourceName: "setting")
            settingslbl.textColor = UIColor.lightGray
            
            profile.image = #imageLiteral(resourceName: "profile")
            profileLbl.textColor = UIColor.lightGray
            
        } else if sender.tag == 2{
            self.title = "Discover"
            
            matches.image = #imageLiteral(resourceName: "match")
            matcheslbl.textColor = UIColor.lightGray
            
            fav.image = #imageLiteral(resourceName: "fav")
            favLbl.textColor = UIColor.lightGray
            
            discover.image = #imageLiteral(resourceName: "discover1")
            discoverlbl.textColor = ORANGE_FONT_COLOR
            
            settings.image = #imageLiteral(resourceName: "setting")
            settingslbl.textColor = UIColor.lightGray
            
            profile.image = #imageLiteral(resourceName: "profile")
            profileLbl.textColor = UIColor.lightGray
            
        } else if sender.tag == 3{
            self.title = "Settings"
            
            matches.image = #imageLiteral(resourceName: "match")
            matcheslbl.textColor = UIColor.lightGray
            
            fav.image = #imageLiteral(resourceName: "fav")
            favLbl.textColor = UIColor.lightGray
            
            discover.image = #imageLiteral(resourceName: "discover")
            discoverlbl.textColor = UIColor.lightGray
            
            settings.image = #imageLiteral(resourceName: "setting1")
            settingslbl.textColor = ORANGE_FONT_COLOR
            
            profile.image = #imageLiteral(resourceName: "profile")
            profileLbl.textColor = UIColor.lightGray
            
        } else if sender.tag == 4{
             self.title = "Profile"
            matches.image = #imageLiteral(resourceName: "match")
            matcheslbl.textColor = UIColor.lightGray
            
            fav.image = #imageLiteral(resourceName: "fav")
            favLbl.textColor = UIColor.lightGray
            
            discover.image = #imageLiteral(resourceName: "discover")
            discoverlbl.textColor = UIColor.lightGray
            
            settings.image = #imageLiteral(resourceName: "setting")
            settingslbl.textColor = UIColor.lightGray
            
            profile.image = #imageLiteral(resourceName: "profile1")
            profileLbl.textColor = ORANGE_FONT_COLOR
        }
        
        
        
        selectedIndex = sender.tag
        let previousIndex = selectedIndex
        
        //Remove the Previous ViewController and Set Button State.
        buttons[previousIndex].isSelected = false
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        //Add the New ViewController and Set Button State.
        sender.isSelected = true
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
}

