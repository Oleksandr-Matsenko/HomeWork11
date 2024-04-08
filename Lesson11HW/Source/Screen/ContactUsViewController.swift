//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController {
    
    // MARK: - UI Elements
    
    private let builder = UIBuilder()
    private lazy var contactUsTextView = builder.makeTextView()
    private lazy var placeholderLabel = builder.makeLabel(with: "Type here...")
    private lazy var countLabel = builder.makeLabel(with: "0/320")
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.isEnabled = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.systemGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(backtoVC), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        contactUsTextView.delegate = self
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        view.addSubview(contactUsTextView)
        contactUsTextView.addSubview(placeholderLabel)
        view.addSubview(countLabel)
        view.addSubview(submitButton)
        setupConstraints()
        
      
    }
    // MARK: - Constraints
    private func setupConstraints() {
        contactUsTextView.text = ""
        contactUsTextView.isEditable = true
        
        NSLayoutConstraint.activate([
            
            // ContactView constraints
            
            contactUsTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            contactUsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            contactUsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            contactUsTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // Placeholder constraints
            
            placeholderLabel.centerXAnchor.constraint(equalTo: contactUsTextView.centerXAnchor),
            placeholderLabel.centerYAnchor.constraint(equalTo: contactUsTextView.centerYAnchor),
            
            // Count label constraints
            
            countLabel.topAnchor.constraint(equalTo: contactUsTextView.bottomAnchor, constant: 5),
            countLabel.trailingAnchor.constraint(equalTo: contactUsTextView.trailingAnchor, constant: -10),
            
            // Submit button constraints
            
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            submitButton.heightAnchor.constraint(equalToConstant: 45),
            submitButton.widthAnchor.constraint(equalTo: contactUsTextView.widthAnchor, multiplier: 0.3)
        ])
    }
    @objc private func backtoVC() {
        navigationController?.popViewController(animated: true)
    }

}
// MARK: - UITextViewDelegate Methods

extension ContactUsViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 320
      
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
        let text = textView.text ?? ""
        let textCounter = text.count
        countLabel.textColor = textCounter == 320 ? .systemRed : .systemGray
        countLabel.text = "\(textCounter)/320"
        
        if textCounter >= 15 {
            submitButton.isEnabled = true
            submitButton.setTitleColor(.systemGreen, for: .normal)
            submitButton.layer.borderColor = UIColor.systemGreen.cgColor
            submitButton.layer.borderWidth = 2
        } else {
            submitButton.isEnabled = false
            submitButton.setTitleColor(.black, for: .normal)
            submitButton.layer.borderColor = UIColor.systemGray.cgColor
            submitButton.layer.borderWidth = 1

            
        }
    }
    
}

