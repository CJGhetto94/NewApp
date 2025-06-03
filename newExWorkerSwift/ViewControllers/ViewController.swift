import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let shadowView = ShadowView(imageName: ShadowViewType.helloWorld.rawValue)
    private let stackView = UIStackView()
    private let numberButton = CustomButton(textButton: "Change number", bgColor: .systemRed)
    private let imageButton = CustomButton(textButton: "Change image", bgColor: .systemGreen)
    
    private let helper = Helper()
    
    private var isOneImage = true
    
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
        addAction()
        
        setupLayout()
    }
    private func updateNumbers() {
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
        helper.addNumber(randomNumber)
    }
    
    @objc
    private func numberButtonTapped() {
        textLabel.text = helper.getRandomNumber().formatted()
    }
}

// MARK: - Setup View
private extension ViewController {
    func addAction() {
        numberButton.addTarget(self,
                               action: #selector(numberButtonTapped),
                               for: .touchUpInside)
        
        let action = UIAction { _ in
            self.isOneImage.toggle()
            
            let randomImageName = self.isOneImage
            ? ShadowViewType.helloWorld
            : ShadowViewType.secondHelloWorld
            
            self.shadowView.updateImage(randomImageName.rawValue)
        }
        
        imageButton.addAction(action, for: .touchUpInside)
    }
    
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
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
            
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
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
