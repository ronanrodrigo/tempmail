@testable import TempMail

class GenerateMailboxPresenterSpy: GenerateMailboxPresenter {

    var presentedMail: String?
    var displayedError = false

    func displayMailbox(with email: String) {
        presentedMail = email
    }

    func displayError(with error: MailboxGatewayErrors) {
        displayedError = true
    }

}
