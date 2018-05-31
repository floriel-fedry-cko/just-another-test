import Foundation
import Vapor

struct AuthorizeWithCardIdRequest: Content {
    var cardId: String
    var cvv: String
    var currency: String
    var email: String
    var value: Int
    var chargeMode: Int?
}
