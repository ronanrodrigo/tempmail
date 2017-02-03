import Foundation

protocol GenerateMailboxPresenter {

    func displayMailbox(with email: String)
    func displayError(with error: MailboxGatewayErrors)

}
