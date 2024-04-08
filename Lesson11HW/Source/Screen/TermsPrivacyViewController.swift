//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController {
    
    // MARK: - UI Elements
    
    private let builder = UIBuilder()
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var  termsPrivacyTextView = builder.makeTextView()
        
    
    private lazy var agreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("I agree", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.isEnabled = false
        button.addTarget(self, action: #selector(agree), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Setup Methods
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(termsPrivacyTextView)
        view.addSubview(agreeButton)
        scrollView.delegate = self
        termsPrivacyTextView.delegate = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView Setup
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: agreeButton.topAnchor, constant: -20),
            // TextView Setup
            termsPrivacyTextView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            termsPrivacyTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            termsPrivacyTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            termsPrivacyTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            termsPrivacyTextView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            termsPrivacyTextView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            // Agree Button setup
            agreeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            agreeButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            agreeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            agreeButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
extension TermsPrivacyViewController: UITextViewDelegate {
    
    // MARK: - UITextViewDelegate Methods
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isAtBottom = scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height
        agreeButton.isEnabled = isAtBottom
        agreeButton.setTitleColor(isAtBottom ? .systemBlue : .systemGray, for: .normal)
        agreeButton.layer.borderColor = isAtBottom ? UIColor.systemBlue.cgColor : UIColor.systemGray.cgColor
    }

    @objc private  func agree(){
        navigationController?.popViewController(animated: true)
    }
}

