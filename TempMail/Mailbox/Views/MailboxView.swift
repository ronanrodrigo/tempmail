import UIKit

enum MailBoxViewElements {
    case address
}

class MailboxView: UIView {

    let address: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let textFieldHeight: CGFloat = 30
        textField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        textField.font = UIFont.normal.normal
        return textField
    }()

    init() {
        super.init(frame: .zero)
        setupHierarchyViews()
        setupHierarchyConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setText(_ value: String, for element: MailBoxViewElements) {
        switch element {
        case .address: address.text = value
        }
    }

    private func setupHierarchyViews() {
        addSubview(address)
    }

    private func setupHierarchyConstraints() {
        [address.leadingAnchor.constraint(equalTo: leadingAnchor),
         trailingAnchor.constraint(equalTo: address.trailingAnchor),
         address.topAnchor.constraint(equalTo: topAnchor)].activate().forEach { $0.constant = 10 }
    }

}
