import Foundation

extension MailboxView: GenerateMailboxPresenter {

    func displayMailbox(with email: String) {
        DispatchQueue.main.async { [weak self] in
            self?.setText(email, for: .address)
        }
    }

    func displayError(with error: MailboxGatewayErrors) {}

}
