import Foundation

struct GenerateMailboxUsecase {

    private let presenter: GenerateMailboxPresenter
    private let mailBoxGateway: MailboxGateway
    private let cryptoGateway: CryptoGateway
    private let randomUsersGateway: RandomUsersGateway

    init(presenter: GenerateMailboxPresenter, mailBoxGateway: MailboxGateway, cryptoGateway: CryptoGateway,
         randomUsersGateway: RandomUsersGateway) {
        self.presenter = presenter
        self.mailBoxGateway = mailBoxGateway
        self.cryptoGateway = cryptoGateway
        self.randomUsersGateway = randomUsersGateway
    }

    func generate() {
        let randomUser = randomUsersGateway.generateUsername()
        mailBoxGateway.getDomain { result in
            self.processResult(result, randomUser: randomUser)
        }
    }

    private func processResult(_ result: Result<Domain, MailboxGatewayErrors>, randomUser: String) {
        switch result {
        case let .success(domain):
            let emailAddress = randomUser + domain.name
            let emailAddressMd5 = cryptoGateway.generateMD5FromString(value: emailAddress)
            mailBoxGateway.save(email: emailAddress, md5: emailAddressMd5)
            presenter.displayMailbox(with: emailAddress)
        case let .failure(error):
            presenter.displayError(with: error)
        }
    }

}
