import UIKit

class ViewController: UIViewController {
    private let helper = Helper()
    private let textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(ciColor: .gray)
        updateNumbers()
        setupLabel()
        
        view.addSubview(textLabel)
        
    }
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .red
        textLabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
    }
}

