//
//  BubbleTextField.swift
//  BubbleTextField
//
//  Created by Chris Zielinski on 7/13/18.
//  Copyright © 2018 Big Z Labs. All rights reserved.
//

import Cocoa

open class BubbleTextField: NSTextField {

    var widthConstraint: NSLayoutConstraint!
    fileprivate var bubbleTextFieldCell: BubbleTextFieldCell? {
        return cell as? BubbleTextFieldCell
    }
    public var isContinuousSpellCheckingEnabled: Bool = false {
        didSet {
            bubbleTextFieldCell?.isContinuousSpellCheckingEnabled = isContinuousSpellCheckingEnabled
        }
    }

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        sharedInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func sharedInit() {
        let bubbleTextFieldCell = BubbleTextFieldCell(textCell: stringValue)
        bubbleTextFieldCell.isContinuousSpellCheckingEnabled = isContinuousSpellCheckingEnabled
        cell = bubbleTextFieldCell

        isBezeled = true
        bezelStyle = .roundedBezel
        isEditable = true
        usesSingleLineMode = true
        lineBreakMode = .byClipping
        alignment = .left
        allowsEditingTextAttributes = false
        translatesAutoresizingMaskIntoConstraints = false

        widthConstraint = widthAnchor.constraint(equalToConstant: 0)
        widthConstraint.isActive = true
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        sharedInit()
    }

    override open func updateConstraints() {
        super.updateConstraints()
        widthConstraint.constant = cell!.cellSize.width + 3
    }

    override open func textDidChange(_ notification: Notification) {
        super.textDidChange(notification)
        needsUpdateConstraints = true
    }

}

private class BubbleTextFieldCell: NSTextFieldCell {

    var fieldEditor: BubbleTextView = BubbleTextView()
    var isContinuousSpellCheckingEnabled: Bool {
        set {
            fieldEditor.isContinuousSpellCheckingEnabled = newValue
        }
        get {
            return fieldEditor.isContinuousSpellCheckingEnabled
        }
    }

    override var cellSize: NSSize {
        let superSize = super.cellSize

        guard let layoutManager = fieldEditor.layoutManager,
            let textContainer = fieldEditor.textContainer
            else { return superSize }

        if fieldEditor.superview == nil {
            fieldEditor.string = stringValue
        }

        layoutManager.ensureLayout(for: textContainer)
        let size = layoutManager.usedRect(for: textContainer).size
        return NSSize(width: size.width, height: max(size.height, superSize.height))
    }

    init() {
        super.init(textCell: "")
    }

    override init(textCell string: String) {
        super.init(textCell: string)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func fieldEditor(for controlView: NSView) -> NSTextView? {
        return fieldEditor
    }

    override func drawingRect(forBounds rect: NSRect) -> NSRect {
        let superRect = super.drawingRect(forBounds: rect)
        return NSRect(x: 0,
                      y: superRect.origin.y,
                      width: rect.width,
                      height: superRect.size.height)
    }
}

private class BubbleTextView: NSTextView {

    override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
        super.init(frame: frameRect, textContainer: container)

        isRichText = false
        isFieldEditor = true
        translatesAutoresizingMaskIntoConstraints = false
        NotificationCenter.default.addObserver(self, selector: #selector(frameDidChange),
                                               name: NSView.frameDidChangeNotification,
                                               object: nil)
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidMoveToSuperview() {
        super.viewDidMoveToSuperview()

        if let superview = superview {
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                topAnchor.constraint(equalTo: superview.topAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor)
                ])
        }
    }

    @objc
    func frameDidChange() {
        guard let superview = superview else { return }

        if superview.frame.width < frame.width {
            superview.setFrameSize(frame.size)
        }
    }
}

