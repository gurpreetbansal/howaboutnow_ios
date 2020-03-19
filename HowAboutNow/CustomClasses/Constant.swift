

import UIKit
import AVFoundation

let baseUrl = "https://clientstagingdev.com/how_about_now/API/index.php?p="

let welcomeHeading = ["Discover new and interesting people nearby", "Swipe Right to like someone or Swipe left to pass", "If they also Swipe Right then 'it's a Match'","Only people you've matched with can message you"]

let welcomeImage = [UIImage(named: "image1"), UIImage(named: "image2"),UIImage(named: "image3"),UIImage(named: "image4")]

let settingTitles = [["Filter"], ["Language","Notifications","Updgrade Premium"],["Invite your friends","About","Help Center","Feedback","Rate the App"], ["Logout"], [""]]

let notificationTitles = [["Special Offer & Permotions", "When it's a friend's birthday","Purchase Notifications"],["When someone like you","When someone visits your profile","When you get a new message","When you have a new match","When you get a new recommendation"]]

let profileMenu = ["GIFTS", "INTERESTS","MOVIES","MUSIC","TELEVISIONS","BOOKS"]

let profileMenuImages = [UIImage(named: "gift1"),UIImage(named: "gift2"),UIImage(named: "gift3"),UIImage(named: "gift4"),UIImage(named: "gift5"),UIImage(named: "gift6"),UIImage(named: "gift7"),UIImage(named: "gift8")]

let ORANGE_FONT_COLOR = UIColor(red: 215/255.0, green: 109/255.0, blue: 52/255.0, alpha: 1.0)

let THEME_COLOR = UIColor(red: 67/255.0, green: 37/255.0, blue: 111/255.0, alpha: 1.0)

public enum APIEndPoint
{
    public enum userCase {
        case signup
        case login
        case city
        case vehicle
        case status
        case orderList
        case orderDetail
        case getProfile
        case editProfile
        case IssueList
        case confirmOrder
        var caseValue: String{
            switch self{
            case .signup:                    return "signup"
            case .login:                     return "login"
            case .city:                      return "/city"
            case .vehicle:                   return "/driver/vehical-list"
            case .status:                    return "/driver/status"
            case .orderList:                 return "/driver/order/assigned-orders"
            case .orderDetail:               return "/driver/order/assigned-orders-details"
            case .getProfile:                return "/driver/profile-get"
            case .editProfile:               return "/driver/profile-edit"
            case .IssueList:                 return "/driver/optionList"
            case .confirmOrder:              return "/driver/order/confirm-delivery"
            }
        }
    }
}
