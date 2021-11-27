//
//  BorderTextField.swift
//  MusalaSoftiOSTask
//
//  Created by kjoe on 11/26/21.
//

import UIKit
@IBDesignable
class BorderTextField: UITextField {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
                layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 28 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.white {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowOffset: Double = 0 {
        didSet {
            layer.shadowOffset = CGSize(width: 0, height: shadowOffset)
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.64 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return  bounds.insetBy(dx: 20, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    @IBInspectable var rightImage: UIImage = UIImage() {
        didSet {
            let imageView = UIImageView(image: rightImage)
            self.rightView = imageView
        }
    }
    @IBInspectable var isRightViewVisible: Bool = false {
        didSet {
            if isRightViewVisible {
                rightViewMode = .always
            } else {
                rightViewMode = .never
            }
        }
    }
    @IBInspectable var leftImage: UIImage = UIImage() {
        didSet {
            let imageView = UIImageView(image: leftImage)
            self.leftView = imageView
        }
    }
    @IBInspectable var isLeftViewVisible: Bool = false {
        didSet {
            if isLeftViewVisible {
                leftViewMode = .always
            } else {
                leftViewMode = .never
            }
        }
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - (13 + 24), y: 12, width: 24, height: 12)
    }
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
                // MARK: - Do something what you want
            }
        }
    }
}
