import Foundation
import Vapor

struct DeleteCardRequest: Content {
    var cardId: String
    var customerId: String?
    var email: String?
}
