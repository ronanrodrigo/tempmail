import Foundation

struct MailboxGatewayTempMailAPI: MailboxGateway {

    func save(email: String, md5: String) {
    }

    func getDomain(completion: @escaping (Result<Domain, MailboxGatewayErrors>) -> Void) {
        guard let url = URL(string: "https://api.temp-mail.org/request/domains/format/json") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(Result.failure(self.generateMailboxErros(error: error)))
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            completion(Result.success(self.generateDomainValueOject(json: json)))
        }.resume()
    }

    private func generateDomainValueOject(json: Any?) -> Domain {
        guard let domainNames = json as? [String], let randomDomainName = domainNames.first else {
            return DomainValueObject(name: "@nutpa.net")
        }
        return DomainValueObject(name: randomDomainName)
    }

    private func generateMailboxErros(error: Error?) -> MailboxGatewayErrors {
        return .unknown
    }
}
