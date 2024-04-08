//
//  ProfileViewController.swift
//  Lesson11HW
//

//

import UIKit

class ProfileViewController: BaseViewController {
    
    private var editMode = false
    
    // MARK: - UI Elements
    
    private let builder = UIBuilder()
    private lazy var userInfoStackVIew: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 50
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let firstName = builder.makeTextField(placeholder: "First Name:")
        
        let lastName = builder.makeTextField(placeholder: "Last Name:")
        
        [firstName,lastName].forEach{
            stack.addArrangedSubview($0)
        }
        
        let firstCountLabel = builder.makeLabel(with: "")
        let lastCountLabel = builder.makeLabel(with: "")
        firstName.addSubview(firstCountLabel)
        lastName.addSubview(lastCountLabel)
        
        // Constraints to Labels
              
        
        NSLayoutConstraint.activate([
            firstCountLabel.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 5),
            firstCountLabel.trailingAnchor.constraint(equalTo: firstName.trailingAnchor, constant: -10),
            
            lastCountLabel.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 5),
            lastCountLabel.trailingAnchor.constraint(equalTo: lastName.trailingAnchor, constant: -10),
        ])
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(userInfoStackVIew)
        NSLayoutConstraint.activate([
            userInfoStackVIew.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userInfoStackVIew.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            userInfoStackVIew.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - Private
private extension ProfileViewController {
    
    func setupActions() {
        updateRigthtBarButton()
        // Set UITextFieldDelegate for text fields
        if let firstNameField = userInfoStackVIew.arrangedSubviews[0] as? UITextField,
           let lastNameField = userInfoStackVIew.arrangedSubviews[1] as? UITextField {
            firstNameField.delegate = self
            lastNameField.delegate = self
        }
    }
    
    func updateRigthtBarButton() {
        
        let title = editMode ? "Done" : "Edit"
        
        
        
        let barButton = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func changeModeButtonDidTap() {
        debugPrint("ProfileViewController -> changeModeButtonDidTap")
        let userInfoStack = userInfoStackVIew
        guard let firstNameField = userInfoStack.arrangedSubviews[0] as? UITextField else { return }
        guard let lastNameField = userInfoStack.arrangedSubviews[1] as? UITextField else { return }

        guard let firstCharacterCountLabel = firstNameField.subviews.first else { return }
        guard let lastCharacterCountLabel = lastNameField.subviews.first else { return }
        
        if !editMode {
            [firstNameField, lastNameField].forEach{
                $0.textAlignment = .center
                $0.isEnabled = true
                $0.textColor = .systemGray
                $0.layer.borderColor = UIColor.systemBlue.cgColor
            }
            firstNameField.placeholder = "Enter first name..."
            lastNameField.placeholder = "Enter last name..."
            
        } else {
            [firstNameField, lastNameField].forEach{
                $0.textAlignment = .center
                $0.isEnabled = false
                $0.textColor = .systemBlue
                $0.layer.borderColor = UIColor.systemGray.cgColor
            }
            firstNameField.placeholder = "First name..."
            lastNameField.placeholder = "Last name..."
        }
        editMode.toggle()
        updateRigthtBarButton()
        
        if editMode {
            [firstCharacterCountLabel,lastCharacterCountLabel].forEach{
                $0.isHidden = false}
        } else {
            [firstCharacterCountLabel,lastCharacterCountLabel].forEach{
                $0.isHidden = true}
        }
    }
}

// MARK: - SetUp TextFields

extension ProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxSize = 30
        guard let text = textField.text, let characterCountLabel = textField.subviews.first as? UILabel else { return true }
        
        let newSize = text.count + string.count - range.length
        
        if newSize <= maxSize {
            characterCountLabel.text = "\(maxSize - newSize)"
            characterCountLabel.textColor = newSize < maxSize ? .systemGreen : .systemRed
            return true
        } else {
            return false
        }
        
    }
    
}
