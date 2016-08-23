import Foundation
import UIKit

final class InfoList: UIView {

    let presenterInfo = Info()
    let tagsInfo = Info()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupLayout()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        presenterInfo.updateInfo("Presenter", text: ["Vicki Wenderlich"])
        tagsInfo.updateInfo("Tags", text: ["development", "teams", "business"])
    }
    
    private func setupHierarchy() {
        addSubview(presenterInfo)
        addSubview(tagsInfo)
    }
    
    private func setupLayout() {
        presenterInfo.pinToSuperview([.Left, .Top, .Right])
        tagsInfo.attachToBottomOf(presenterInfo, withConstant: 30)
        tagsInfo.pinToSuperview([.Left, .Bottom, .Right])
    }

}

class HeaderLabel: UILabel {

    override var text: String? {
        get {
            return super.text
        }
        set(newText) {
            super.text = newText?.uppercaseString
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }

    func applyStyle() {
        self.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }


}


class TextLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyle()
    }

    func applyStyle() {
        self.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }

}

import UIKit

final class Info: UIView {

    let presenterHeader = HeaderLabel()
    let presenterStack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupLayout()
    }

    convenience init() {
        self.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        presenterStack.alignment = .Trailing
        presenterStack.axis = .Vertical
    }
    
    private func setupHierarchy() {
        addSubview(presenterHeader)
        addSubview(presenterStack)
    }

    private func setupLayout() {
        presenterHeader.pinToSuperviewTop(withInset: 8.0)
        presenterHeader.pinToSuperviewRight()
        presenterStack.attachToBottomOf(presenterHeader, withConstant: 8.0)
        presenterStack.alignRightToView(presenterHeader)
        presenterStack.pinToSuperviewBottom()
    }

    func updateInfo(header: String, text: [String]){
        presenterHeader.text = header

        for textItem in text {
            let newTextLabel = TextLabel()
            newTextLabel.text = textItem
            presenterStack.addArrangedSubview(newTextLabel)
        }
    }
    
}

