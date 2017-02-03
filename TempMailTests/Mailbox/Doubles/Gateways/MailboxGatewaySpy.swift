@testable import TempMail

class MailboxGatewaySpy: MailboxGateway {

    var collectedDomains = false
    var generateRandomEmailResult: Result<Domain, MailboxGatewayErrors>?
    var savedEmail: String?
    var savedMd5: String?

    func getDomain(completion: @escaping (Result<Domain, MailboxGatewayErrors>) -> Void) {
        guard let generateRandomEmailResult = generateRandomEmailResult else {
            return
        }
        switch generateRandomEmailResult {
        case .success(_): collectedDomains = true
        case .failure(_): collectedDomains = false
        }
        completion(generateRandomEmailResult)
    }

    func save(email: String, md5: String) {
        savedEmail = email
        savedMd5 = md5
    }

}
