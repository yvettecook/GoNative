import Foundation

struct StackViewModel {

    let title = "Identity"
    let description = "San Francisco is the system font on Apple TV. There are two variants of this font, both of which were designed for high legibility on a big screen: San Francisco Text and San Francisco Display. When you use the system font for text in labels and other interface elements, Apple TV automatically applies the most appropriate text style of the font based on the point size. It also switches fonts automatically as needed and respects accessibility settings. Minimize text. Show, don’t tell. Reading lots of text on a screen across the room strains the eyes and isn’t much fun. Seriously consider how much text your app really needs to show and see what you can communicate with images or an animation instead. If you use images, be sure to provide alternative text that VoiceOver can use to describe the imagery to people with visual impairments."

    static let playButton = ButtonViewModel(imageName: "play", subtitle: "Play")
    static let buyButton = ButtonViewModel(buttonTitle: "$9", subtitle: "Buy")

    let buttonRow = RowViewModel(buttons: [StackViewModel.playButton, StackViewModel.buyButton])

}