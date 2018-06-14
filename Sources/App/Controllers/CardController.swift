import Vapor

/// Card Controller
final class CardController {
    
    let endpoint = "charges/token"
    
    /// Returns the response to a zero dollar authorization
    func get(_ req: Request) throws -> Future<Customer> {
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Get parameter
        let customerId = try req.parameters.next(String.self)
        // Send request and get response
        let response: Future<Response> = client.get("\(merchantConfig.baseUrl)\(endpoint)\(customerId)", headers: merchantConfig.headers)
        // Transform the response
        let customer = response.flatMap(to: Customer.self) { response in
            return try response.content.decode(Customer.self)
        }
        return customer
    }
    
    func verify(_ req: Request, card: CardToken) throws -> Future<ChargeResponse> {
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Create the zero dollar request
        var zeroDollarRequest = ChargeRequest(cardToken: card.cardToken, currency: "USD", value: 0)
        zeroDollarRequest.customerId = card.customerId
        zeroDollarRequest.email = card.customerEmail
        zeroDollarRequest.transactionIndicator = "2"
        // Send request and get response
        let response = client.post("\(merchantConfig.baseUrl)\(endpoint)", headers: merchantConfig.headers) { request in
            try request.content.encode(zeroDollarRequest)
            }.flatMap(to: ChargeResponse.self) { res in
                return try res.content.decode(ChargeResponse.self)
        }
        return response
    }

    func charge(_ req: Request, chargeRequest: ChargeRequest) throws -> Future<ChargeResponse> {
        // Set values
        var chargeReq = chargeRequest
        if chargeRequest.value == nil {
            chargeReq.value = 100
        }
        if chargeRequest.currency == nil {
            chargeReq.currency = "GBP"
        }
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Send request and get response
        let response = client.post("\(merchantConfig.baseUrl)\(endpoint)", headers: merchantConfig.headers) { request in
            try request.content.encode(chargeReq)
            }.flatMap(to: ChargeResponse.self) { res in
                return try res.content.decode(ChargeResponse.self)
        }
        return response
    }
    
    func authorizeWith3ds(_ req: Request, authorizationRequest: AuthorizeWithCardIdRequest) throws -> Future<AuthorizeWithCardIdResponse> {
        // Get Merchant Configuration
        let merchantConfig = try req.make(MerchantConfig.self)
        // Get HTTP Client instance
        let client = try req.make(Client.self)
        // Send request
        let response = client.post("\(merchantConfig.baseUrl)charges/card", headers: merchantConfig.headers) { request in
            let auth = AuthorizeWithCardIdRequest(cardId: authorizationRequest.cardId,
                                                  cvv: authorizationRequest.cvv,
                                                  currency: authorizationRequest.currency,
                                                  email: authorizationRequest.email,
                                                  value: authorizationRequest.value,
                                                  chargeMode: 2)
            try request.content.encode(auth)
            }.flatMap(to: AuthorizeWithCardIdResponse.self) { res in
                print(res)
                return try res.content.decode(AuthorizeWithCardIdResponse.self)
            }
        return response
    }
}

