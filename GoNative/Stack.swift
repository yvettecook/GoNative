import UIKit

final class Stack: UIView {

    let title = UILabel()
    let descriptionLabel = UILabel()
    let row = Row()

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
        title.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)
        descriptionLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        descriptionLabel.numberOfLines = 0
    }
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(descriptionLabel)
        addSubview(row)
    }
    
    private func setupLayout() {
        title.pinToSuperview([.Left, .Top, .Right])
        descriptionLabel.attachToBottomOf(title, withConstant: 75)
        descriptionLabel.pinToSuperview([.Left, .Right])
        row.attachToBottomOf(descriptionLabel, withConstant: 100)
        row.pinToSuperview([.Left, .Right])
    }

    func updateInfo(viewModel: StackViewModel) {
        title.text = viewModel.title
        descriptionLabel.text = viewModel.description

        row.update(with: viewModel.buttonRow)
    }
    
}

final class Row: UIView {

    let rowStack = UIStackView()

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
        rowStack.axis = .Horizontal
    }
    
    private func setupHierarchy() {
        addSubview(rowStack)
    }
    
    private func setupLayout() {
        rowStack.pinToSuperviewEdges()
    }

    func update(with viewModel: RowViewModel) {
        for buttonVM in viewModel.buttons {
            let button = SubtitleButton()
            button.addSizeConstraints(width: 175, height: 100)
            button.update(with: buttonVM)
            rowStack.addArrangedSubview(button)
        }
    }
    
}



