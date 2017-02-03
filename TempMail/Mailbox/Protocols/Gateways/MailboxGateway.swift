protocol MailboxGateway {

    func save(email: String, md5: String)
    func getDomain(completion: @escaping (Result<Domain, MailboxGatewayErrors>) -> Void)

}
