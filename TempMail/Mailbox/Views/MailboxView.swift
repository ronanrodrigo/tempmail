import UIKit

class MailboxView: UIView {

    lazy var address: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        let textFieldHeight: CGFloat = 30
        textField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
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

    private func setupHierarchyViews() {
        addSubview(address)
    }

    private func setupHierarchyConstraints() {
        [address.leadingAnchor.constraint(equalTo: leadingAnchor),
         trailingAnchor.constraint(equalTo: address.trailingAnchor),
         address.topAnchor.constraint(equalTo: topAnchor)].activate().forEach { $0.constant = 10 }
    }

}
