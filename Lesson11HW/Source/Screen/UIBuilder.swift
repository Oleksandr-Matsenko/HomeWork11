//
//  UIBuilder.swift
//  Lesson11HW
//
//  Created by Alex Matsenko on 08.04.2024.
//

import UIKit
class UIBuilder {
    
    func makeTextField(placeholder: String) -> UITextField {
        let field = UITextField()
        field.placeholder = placeholder
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderColor = UIColor.systemGray.cgColor
        field.layer.borderWidth = 1
        field.isEnabled = false
        field.backgroundColor = .clear
        field.font = .systemFont(ofSize: 20, weight: .regular)
        field.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return field
    }
    
    func makeLabel(with title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func makeTextView() -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = """
                                           Privacy Policy

             ◉ Your privacy is important to us. It is our policy to respect your privacy regarding any information we may collect from you across our website.

             ◉ We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we’re collecting it and how it will be used.
             
             ◉ We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we’ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.
             
             ◉ We don’t share any personally identifying information publicly or with third-parties, except when required to by law.
             
             ◉ Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.
             
             ◉ You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.
             
             ◉ Your continued use of our website will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.
             
             ◉ Rulefinder Data Privacy considers an organisation's data privacy obligations globally including GDPR, PIPL, and CCPA available as an annual subscription.
             
              No tie-ins, no fuss compare obligations including individual access rights, cookies, breach response, sanctions, consent, territorial scope, keep ahead of developments with daily horizon scanning alerts and a dedicated tracker.
             
             Global privacy laws in development, read more on our coverage of direct marketing, international data transfers, and employment
             option to access our legal analysis via a privacy management system
             """
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }

}
