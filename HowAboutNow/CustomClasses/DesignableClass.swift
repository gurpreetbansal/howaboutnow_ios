//  DesignableClass.swift
//  fashLOCO
//
//  Created by apple on 24/04/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import UIKit
//MARK:===============DesignableButton=====================
@IBDesignable class DesignableButton: UIButton {
    
    @IBInspectable var CornerRadius :CGFloat = 0.0 {
        didSet{self.layer.cornerRadius = CornerRadius}
    }
    
    @IBInspectable var BorderWidth :CGFloat = 0.0 {
         didSet{self.layer.borderWidth = BorderWidth}
    }
   @IBInspectable var BorderColor :UIColor = .clear {
        didSet{ self.layer.borderColor = BorderColor.cgColor}
    }
}
//MARK:===============DesignableView=====================
@IBDesignable class DesignableView: UIView{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{self.layer.cornerRadius = CornerRadius}
    }
    @IBInspectable var BorderWidth :CGFloat = 0.0 {
        didSet{self.layer.borderWidth = BorderWidth}
    }
    @IBInspectable var BorderColor :UIColor = .clear {
        didSet{ self.layer.borderColor = BorderColor.cgColor}
    }
    //MARK:===============DesignableShadowView=====================
       /// The color of the shadow. Defaults to opaque black. Colors created from patterns are currently NOT supported. Animatable.
       @IBInspectable var shadowColor: UIColor? {
           get {
               return UIColor(cgColor: self.layer.shadowColor!)
           }
           set {
               self.layer.shadowColor = newValue?.cgColor
           }
       }
       
       /// The opacity of the shadow. Defaults to 0. Specifying a value outside the [0,1] range will give undefined results. Animatable.
       @IBInspectable var shadowOpacity: Float {
           get {
               return self.layer.shadowOpacity
           }
           set {
               self.layer.shadowOpacity = newValue
           }
       }
       
       /// The shadow offset. Defaults to (0, -3). Animatable.
       @IBInspectable var shadowOffset: CGSize {
           get {
               return self.layer.shadowOffset
           }
           set {
               self.layer.shadowOffset = newValue
           }
       }
       
       /// The blur radius used to create the shadow. Defaults to 3. Animatable.
       @IBInspectable var shadowRadius: Double {
           get {
               return Double(self.layer.shadowRadius)
           }
           set {
               self.layer.shadowRadius = CGFloat(newValue)
           }
       }
}

//MARK:===============DesignableTextField=====================
@IBDesignable class DesignableTextField: UITextField{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{self.layer.cornerRadius = CornerRadius}
    }
    @IBInspectable var BorderWidth :CGFloat = 0.0 {
        didSet{self.layer.borderWidth = BorderWidth}
    }
    @IBInspectable var BorderColor :UIColor = .clear {
        didSet{ self.layer.borderColor = BorderColor.cgColor}
    }
}

//MARK:===============DesignableImage=====================

@IBDesignable class DesignableImage: UIImageView{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{self.layer.cornerRadius = CornerRadius/2}
    }
    @IBInspectable var BorderWidth :CGFloat = 0.0 {
        didSet{self.layer.borderWidth = BorderWidth}
    }
    @IBInspectable var BorderColor :UIColor = .clear {
        didSet{ self.layer.borderColor = BorderColor.cgColor}
    }
    //MARK:===============DesignableShadowView=====================
       /// The color of the shadow. Defaults to opaque black. Colors created from patterns are currently NOT supported. Animatable.
       @IBInspectable var shadowColor: UIColor? {
           get {
               return UIColor(cgColor: self.layer.shadowColor!)
           }
           set {
               self.layer.shadowColor = newValue?.cgColor
           }
       }
       
       /// The opacity of the shadow. Defaults to 0. Specifying a value outside the [0,1] range will give undefined results. Animatable.
       @IBInspectable var shadowOpacity: Float {
           get {
               return self.layer.shadowOpacity
           }
           set {
               self.layer.shadowOpacity = newValue
           }
       }
       
       /// The shadow offset. Defaults to (0, -3). Animatable.
       @IBInspectable var shadowOffset: CGSize {
           get {
               return self.layer.shadowOffset
           }
           set {
               self.layer.shadowOffset = newValue
           }
       }
       
       /// The blur radius used to create the shadow. Defaults to 3. Animatable.
       @IBInspectable var shadowRadius: Double {
           get {
               return Double(self.layer.shadowRadius)
           }
           set {
               self.layer.shadowRadius = CGFloat(newValue)
           }
       }
 }

//MARK:===============DesignableLable=====================

@IBDesignable class DesignableLabel: UILabel{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{self.layer.cornerRadius = CornerRadius/2}
    }
    @IBInspectable var BorderWidth :CGFloat = 0.0 {
        didSet{self.layer.borderWidth = BorderWidth}
    }
    @IBInspectable var BorderColor :UIColor = .clear {
        didSet{ self.layer.borderColor = BorderColor.cgColor}
    }
}
//MARK:===============DesignableProgressBar=====================

@IBDesignable class DesignableProgressBar: UIProgressView{
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{self.layer.cornerRadius = CornerRadius/2}
    }
}
