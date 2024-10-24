//
//  WDBorderLabel.swift
//  WDBorderLabel
//
//  Created by Dong Lei on 2024/10/24.
//

import UIKit


class WDBorderLabel: UILabel {

    var c_borderColor : UIColor?
    
    var c_borderWidth : CGFloat?
    
    override func draw(_ rect: CGRect) {

        guard let color = c_borderColor,let width = c_borderWidth else {
            super.draw(rect)
            return
        }
        
        let shadowOffset = self.layer.shadowOffset
        let textColor = self.textColor
        
        let c = UIGraphicsGetCurrentContext()
        c?.setLineWidth(width)
        c?.setLineJoin(.round)
        c?.setTextDrawingMode(.stroke)
        self.textColor = color
        super.draw(rect)
        
        c?.setTextDrawingMode(.fill)
        self.textColor = textColor
        self.layer.shadowOffset = .zero
        super.draw(rect)
        
        self.layer.shadowOffset = shadowOffset
        
    }
    
    // 设置一个内边距，以防止文字左右两侧的border被裁剪
    override func drawText(in rect: CGRect) {
        guard let width = c_borderWidth else {
            super.drawText(in: rect)
            return
        }
        super.drawText(in: rect.inset(by: .init(top: 0, left: width / 2, bottom: 0, right: width / 2)))
    }
    
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        guard let width = c_borderWidth else {
            return super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        }
        
        let paddedBounds = bounds.inset(by: UIEdgeInsets(top: 0, left:-width / 2 , bottom: 0, right: -width / 2))
        return super.textRect(forBounds: paddedBounds, limitedToNumberOfLines: numberOfLines)
    }
    
    // 覆盖 intrinsicContentSize 方法，考虑内边距
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + (c_borderWidth ?? 0)
        let height = size.height
        return CGSize(width: width, height: height)
    }
    
    // 更新label尺寸时，考虑内边距
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let sizeThatFits = super.sizeThatFits(size)
        let width = sizeThatFits.width + (c_borderWidth ?? 0)
        let height = sizeThatFits.height
        return CGSize(width: width, height: height)
    }


}
