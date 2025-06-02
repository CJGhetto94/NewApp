import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let shadowView = ShadowView(imageName: ShadowViewType.helloWorld.rawValue)
    private let secondShadowView = ShadowView(imageName: ShadowViewType.secondHelloWorld.rawValue)
    private let stackView = UIStackView()
    
    private let helper = Helper()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(ciColor: .gray)
        updateNumbers()
        
        setupLabel()
        setupStackView()
        view.addGradient()
        view.addSubview(stackView)
        setupLayout()
    }
    private func updateNumbers() {
        helper.addNumber(randomNumber)
    }
}

// MARK: - Setup View
private extension ViewController {
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
        
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textLabel.textColor = .gray
        textLabel.textAlignment = .center
    }
}
//MARK: - Setup Layout
private extension ViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant:  100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        ])
    }
}
//MARK: - Nested types
private extension ViewController {
    enum ShadowViewType: String {
        case helloWorld = "helloWorldImage"
        case secondHelloWorld = "secondHelloWorld"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}
