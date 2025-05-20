import UIKit

class ViewController: UIViewController {
    private let helper = Helper()
    private let textLabel = UILabel()
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(ciColor: .gray)
        updateNumbers()
        setupLabel()
        setupImageContainerView()
        setupImageView()
        setupView()
        
        view.addSubview(textLabel)
        view.addSubview(imageContainerView)
        setupLayout()
    }
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
    }
    
    private func setupImageContainerView() {
        imageContainerView.frame = CGRect(x: 100, y: 310, width: 200, height: 180)
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 10
        
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "helloWorldImage")
        imageView.frame = imageContainerView.bounds
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageContainerView.addSubview(imageView)
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.yellow.cgColor, UIColor.white.cgColor, UIColor.cyan.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textColor = .gray
    }
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

