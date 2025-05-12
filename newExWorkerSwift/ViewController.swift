import UIKit

class ViewController: UIViewController {
    private var helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
    }
    private func updateNumbers() {
        
        helper.addNumber(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
}

