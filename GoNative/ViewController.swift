import UIKit

class ViewController: UIViewController {

    let infoList = InfoList()
    let stack = Stack()
    let stackViewModel = StackViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(infoList)
        infoList.pinToSuperviewLeft()
        infoList.pinToSuperviewTop()
        infoList.addWidthConstraint(withConstant: 300.0)

        view.addSubview(stack)
        stack.attachToRightOf(infoList, withConstant: 50.0)
        stack.pinToSuperviewTop()
        stack.addWidthConstraint(withConstant: 1500.0)
        stack.addHeightConstraint(withConstant: 1000.0)
        stack.updateInfo(stackViewModel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

