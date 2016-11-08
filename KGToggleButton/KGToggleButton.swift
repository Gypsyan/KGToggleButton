//
//  KGToggleButton.swift
//  KGToggleButton
//
//  Created by Anantha Krishnan K G on 08/11/16.
//  Copyright © 2016 Ananth. All rights reserved.
//

import UIKit

@IBDesignable
open class KGToggleButton: UIControl {
    
    fileprivate var innerLayer: CAShapeLayer = CAShapeLayer()
    fileprivate var outerLayer: CAShapeLayer = CAShapeLayer()
    static internal let boundsOffset: CGFloat = 80
    
    @IBInspectable
    open var outerLineWidth: CGFloat = 1.0{
        didSet{
            setUpLayers()
        }
    }
    @IBInspectable
    open var innerLineWidth: CGFloat = 1.0 {
        didSet{
            setUpLayers()
        }
    }
    @IBInspectable
    open var outerLineColor: UIColor = UIColor.red {
        didSet{
            colorLayers()
        }
    }
    @IBInspectable
    open var innerLineColor: UIColor = UIColor.red {
        didSet{
            colorLayers()
        }
    }
    @IBInspectable
    open var shapeCircle: Bool = true {
        didSet{
            setUpLayers()
        }
    }
    
    @IBInspectable
    open var fillWhileToggle: Bool = false {
        didSet{
            colorLayers()
        }
    }
    @IBInspectable
    open var on: Bool = false {
        didSet{
            colorLayers()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        start()
    }
    open override func awakeFromNib() {
        start()
    }
    convenience init(frame: CGRect, on: Bool) {
        self.init(frame: frame)
        self.on = on
    }
    
    internal var outerFrame: CGRect {
        let width = bounds.width
        let height = bounds.height
        
        let x: CGFloat
        let y: CGFloat
        
        let sideLength: CGFloat
        if width > height {
            sideLength = height
            x = (width - sideLength) / 2
            y = 0
        } else {
            sideLength = width
            x = 0
            y = (height - sideLength) / 2
        }
        
        let halfLineWidth = outerLineWidth / 2
        return CGRect(x: x + halfLineWidth, y: y + halfLineWidth, width: sideLength - outerLineWidth, height: sideLength - outerLineWidth)
    }
    
    internal var outerPath: UIBezierPath {
        if shapeCircle {
            return UIBezierPath(ovalIn: outerFrame)
        } else {
            return UIBezierPath(rect: outerFrame)
        }
    }
    
    internal var innerPath: UIBezierPath {
        
        let inset = outerLineWidth / 2
        let innerRect = outerFrame.insetBy(dx: inset, dy: inset)
        
        // Create inner path (Tick mark or Cross mark)
        let path = UIBezierPath()
        let unit = innerRect.width / 33
        let origin = innerRect.origin
        let x = origin.x
        let y = origin.y
        
        if on {
            path.move(to: CGPoint(x: x + (7 * unit), y: y + (18 * unit)))
            path.addLine(to: CGPoint(x: x + (14 * unit), y: y + (25 * unit)))
            path.addLine(to: CGPoint(x: x + (27 * unit), y: y + (10 * unit)))
        }else{
            path.move(to: CGPoint(x: x + (8 * unit), y: y + (8 * unit)))
            path.addLine(to: CGPoint(x: x + (25 * unit), y:y + (25 * unit)))
            
            path.move(to: CGPoint(x: x + (25 * unit), y:y + (8 * unit)))
            path.addLine(to: CGPoint(x: x + (8 * unit), y: y + (25 * unit)))
        }
        return path
    }
    
    func start() {
        
        // set initial color to clear
        innerLayer.fillColor = UIColor.clear.cgColor
        
        // setup Color and layout for layers
        colorLayers()
        setUpLayers()
        
        // Add layers to the subLayers
        layer.addSublayer(outerLayer)
        layer.addSublayer(innerLayer)
    }
    
    // MARK: Layout
    open override func layoutSubviews() {
        super.layoutSubviews()
        // Also layout the layers when laying out subviews
        setUpLayers()
    }
    
    // MARK: Layout layers
    fileprivate func setUpLayers() {
        // Set frames, line widths and paths for layers
        outerLayer.frame = bounds
        outerLayer.lineWidth = outerLineWidth
        outerLayer.path = outerPath.cgPath
        
        innerLayer.frame = bounds
        innerLayer.lineWidth = innerLineWidth
        innerLayer.path = innerPath.cgPath
    }
    
    // MARK: Color layers
    fileprivate func colorLayers() {
        outerLayer.strokeColor = outerLineColor.cgColor
        if on {
            outerLayer.fillColor = fillWhileToggle ? outerLineColor.cgColor : UIColor.clear.cgColor
        } else{
            outerLayer.fillColor = UIColor.clear.cgColor
        }
        innerLayer.strokeColor = innerLineColor.cgColor
    }
    
    // Overriden methods -
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        return true
    }
    
    open override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        return true
    }
    
    open override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let tappedLocation = touch?.location(in: self) else {
            return
        }
        
        let offset = type(of: self).boundsOffset
        let tappedBounds = CGRect(x: bounds.origin.x - offset, y: bounds.origin.y - offset, width: bounds.width + (2 * offset), height: bounds.height + (2 * offset))
        
        if tappedBounds.contains(tappedLocation) {
            on = !on
            sendActions(for: [UIControlEvents.valueChanged])
            layer.sublayers?.removeAll()
            start()
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        start()
    }
    
    
}
