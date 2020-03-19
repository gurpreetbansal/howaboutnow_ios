//
//  HomeViewController.swift
//  NearBy
//
//  Created by iMarkPC on 15/10/19.
//  Copyright © 2019 iMark. All rights reserved.
//

import UIKit
import Koloda
import pop
private let numberOfCards: Int = 5
private let frameAnimationSpringBounciness: CGFloat = 9
private let frameAnimationSpringSpeed: CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent: CGFloat = 0.0

class HomeViewController: UIViewController {
    var sampleCards = [Card]()
    var Swipe_Images = [[String:Any]]()
    
    @IBOutlet weak var kolodaView: CustomKolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.dataSource = self
        kolodaView.delegate = self
        Swipe_Images = [["name" : "Yasaka Shrine", "city" : "Kyoto", "url" : "https://source.unsplash.com/Xq1ntWruZQI/600x800"],
                            ["name" : "Fushimi Inari Shrine", "city" : "Kyoto", "url" : "https://source.unsplash.com/NYyCqdBOKwc/600x800"],
                            ["name" : "Bamboo Forest", "city" : "Kyoto", "url" : "https://source.unsplash.com/buF62ewDLcQ/600x800"],
                            ["name" : "Brooklyn Bridge", "city" : "New York", "url" : "https://source.unsplash.com/THozNzxEP3g/600x800"],
                            ["name" : "Empire State Building", "city" : "New York", "url" : "https://source.unsplash.com/USrZRcRS2Lw/600x800"],
                            ["name" : "The statue of Liberty", "city" : "New York", "url" : "https://source.unsplash.com/PeFk7fzxTdk/600x800"],
                            ["name" : "Louvre Museum", "city" : "Paris", "url" : "https://source.unsplash.com/LrMWHKqilUw/600x800"],
                            ["name" : "Eiffel Tower", "city" : "Paris", "url" : "https://source.unsplash.com/HN-5Z6AmxrM/600x800"],
                            ["name" : "Big Ben", "city" : "London", "url" : "https://source.unsplash.com/CdVAUADdqEc/600x800"],
                            ["name" : "Great Wall of China", "city" : "China", "url" : "https://source.unsplash.com/AWh9C-QjhE4/600x800"]]
    
    //MARK: Lifecycle
        kolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        kolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        kolodaView.delegate = self
        kolodaView.dataSource = self
        kolodaView.animator = BackgroundKolodaAnimator(koloda: kolodaView)
        kolodaView.layer.cornerRadius = 10
        kolodaView.clipsToBounds = true
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        
        
        // Do any additional setup after loading the view.
    }
   
   
    //MARK: IBActions
       @IBAction func leftButtonTapped() {
           kolodaView?.swipe(.left)
       }
       
       @IBAction func rightButtonTapped() {
           kolodaView?.swipe(.right)
       }
       
       @IBAction func undoButtonTapped() {
           kolodaView?.revertAction()
       }
    
    @IBAction func FlagBtn(_ sender: UIBarButtonItem) {
        OptionActionSheet()
        
    }
    //MARK: Action Sheet to open options
    func OptionActionSheet(){
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let TakeAction = UIAlertAction(title: "REPORT", style: .destructive, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        let ChooseAction = UIAlertAction(title: "UNMATCH", style: .destructive, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        // Add the actions
        optionMenu.addAction(TakeAction)
        optionMenu.addAction(ChooseAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
   

}
//MARK: KolodaViewDelegate
extension HomeViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        kolodaView.resetCurrentCardIndex()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
       // performPushSeguefromController(identifier: "ProfileViewController")
    }
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(_ koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaBackgroundCardAnimation koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation?.springBounciness = frameAnimationSpringBounciness
        animation?.springSpeed = frameAnimationSpringSpeed
        return animation
    }
}

// MARK: KolodaViewDataSource

extension HomeViewController: KolodaViewDataSource {
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return Swipe_Images.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
       // return UIImageView(image: UIImage(named: "cards_\(index + 1)"))
        
        let card =  Bundle.main.loadNibNamed("Card", owner: self, options: nil)![0] as! Card
        card.prepareUI(Name:  Swipe_Images[index]["name"]! as! String, Age: "25", Address:  Swipe_Images[index]["city"]! as! String, img:  Swipe_Images[index]["url"]! as! String)
        self.sampleCards.append(card)
        
        return card
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}
