//
//  CardView.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/26/21.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowsOffSetWidth: CGFloat = 0
    @IBInspectable var shadowsOffSetHeight: CGFloat = 2
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: CGFloat = 0.16
    @IBInspectable var shadowBlur: CGFloat = 32
    @IBInspectable var shadowSpread: CGFloat = 0
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = 4
        if shadowSpread == 0 {
            layer.shadowPath = nil
        } else {
            let dxVal = -shadowSpread
            let rect  = bounds.insetBy(dx: dxVal, dy: dxVal)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        layer.shadowRadius = shadowBlur / 2
        layer.shadowOffset = CGSize(width: shadowsOffSetWidth, height: shadowsOffSetHeight)
        layer.shadowOpacity = Float(shadowOpacity)
    }
}
