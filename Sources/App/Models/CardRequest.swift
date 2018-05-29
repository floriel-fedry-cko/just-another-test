import Foundation
import Vapor

struct CardRequest: Content {
    /// Card number
    var number: String
    /// Expiry month
    var expiryMonth: String
    /// Expiry year
    var expiryYear: String
    /// CVV (card verification value
    var cvv: String
    /// Name of the card owner
    var name: String?
    /// Billing details
    var billingDetails: Address
}
