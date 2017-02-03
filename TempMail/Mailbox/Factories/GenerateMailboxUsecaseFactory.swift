struct GenerateMailboxUsecaseFactory {

    static func make(presenter: GenerateMailboxPresenter) -> GenerateMailboxUsecase {
        return GenerateMailboxUsecase(
            presenter: presenter,
            mailBoxGateway: MailboxGatewayTempMailAPIFactory.make(),
            cryptoGateway: CryptoGatewayCommonCryptoFactory.make(),
            randomUsersGateway: RandomUsersGatewayMemoryFactory.make())
    }

}
