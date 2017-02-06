import UIKit

class MailboxViewController: UIViewController {

    let mailboxView: MailboxView = {
        let view = MailboxView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        setupHierarchyViews()
        setupHierarchyConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchyViews() {
        edgesForExtendedLayout = []
        view.addSubview(mailboxView)
    }

    private func setupHierarchyConstraints() {
        [mailboxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         mailboxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         mailboxView.firstBaselineAnchor.constraint(equalTo: view.topAnchor),
         mailboxView.lastBaselineAnchor.constraint(equalTo: view.bottomAnchor)].activate()
    }

}
