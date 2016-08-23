import UIKit

final class SubtitleButton: UIView {

    let button = UIButton(type: UIButtonType.System)
    let subtitleLabel = UILabel()

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

    }
    
    private func setupHierarchy() {
        addSubview(button)
        addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        button.pinToSuperview([.Left, .Top])
        button.addHeightConstraint(withConstant: 75)
        button.addWidthConstraint(withConstant: 150)
        subtitleLabel.attachToBottomOf(button)
        subtitleLabel.pinToSuperview([.Left, .Bottom, .Right])
    }

    func update(with viewModel: ButtonViewModel) {
        subtitleLabel.text = viewModel.subtitle

        if let imageName = viewModel.imageName {
            let image = UIImage(named: imageName)
            if let badgeImage = image {
                button.imageView?.image = badgeImage
            }
        }

        if let buttonTitle = viewModel.buttonTitle {
            button.setTitle(buttonTitle, forState: UIControlState.Normal)
        }

    }
    
}

