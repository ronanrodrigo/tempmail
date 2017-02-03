import XCTest
@testable import TempMail

class GenerateMailboxUsecaseTests: XCTestCase {

    let md5 = "7c4ff521986b4ff8d29440beec01972d"
    let username = "test"
    let domain = "@vps30.com"

    var usecase: GenerateMailboxUsecase!
    var presenter: GenerateMailboxPresenterSpy!
    var mailBoxGateway: MailboxGatewaySpy!
    var cryptoGateway: CryptoGatewayStub!
    var randomUsersGateway: RandomUsersGatewayStub!

    override func setUp() {
        super.setUp()
        presenter = GenerateMailboxPresenterSpy()
        mailBoxGateway = MailboxGatewaySpy()
        cryptoGateway = CryptoGatewayStub()
        randomUsersGateway = RandomUsersGatewayStub()
        usecase = GenerateMailboxUsecase(presenter: presenter, mailBoxGateway: mailBoxGateway,
                                         cryptoGateway: cryptoGateway, randomUsersGateway: randomUsersGateway)
    }

    func testGenerateMailBoxWithValidEmail() {
        mailBoxGateway.generateRandomEmailResult = Result.success(DomainValueObject(name: domain))

        usecase.generate()

        XCTAssertTrue(mailBoxGateway.collectedDomains)
    }

    func testGenerateMailBoxWithValidEmailAndDisplayMailboxWithMail() {
        mailBoxGateway.generateRandomEmailResult = Result.success(DomainValueObject(name: domain))
        randomUsersGateway.username = username

        usecase.generate()

        XCTAssertNotNil(presenter.presentedMail)
        XCTAssertEqual(presenter.presentedMail, username + domain)
    }

    func testGenerateMailBoxWithValidEmailAndSaveEmailValueAndEmailInMD5() {
        mailBoxGateway.generateRandomEmailResult = Result.success(DomainValueObject(name: domain))
        randomUsersGateway.username = username
        cryptoGateway.md5Value = md5

        usecase.generate()

        XCTAssertNotNil(mailBoxGateway.savedEmail)
        XCTAssertEqual(mailBoxGateway.savedEmail, username + domain)
        XCTAssertNotNil(mailBoxGateway.savedMd5)
        XCTAssertEqual(mailBoxGateway.savedMd5, md5)
    }

    func testGenerateMailBoxWithGatewayErrorDisplayError() {
        mailBoxGateway.generateRandomEmailResult = Result.failure(MailboxGatewayErrors.unknown)
        randomUsersGateway.username = username

        usecase.generate()

        XCTAssertTrue(presenter.displayedError)
    }

}
