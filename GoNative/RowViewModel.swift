import Foundation

struct RowViewModel {

    let buttons: [ButtonViewModel]

}

struct ButtonViewModel {

    let imageName: String?
    let buttonTitle: String?
    let subtitle: String

    init(imageName: String? = nil, buttonTitle: String? = nil, subtitle: String) {
        self.imageName = imageName
        self.buttonTitle = buttonTitle
        self.subtitle = subtitle
    }

}
