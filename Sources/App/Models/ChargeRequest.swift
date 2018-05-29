import Foundation
import Vapor

struct ChargeRequest: Content {
    /// A valid card token, with the prefix card_tok_.
    var cardToken: String
    /// Three-letter ISO currency code representing the currency of the payment.
    var currency: String
    /// The email address of the customer associated with the card ID.
    var email: String?
    /// The customer ID of the customer associated with the card ID.
    var customerId: String?
    /// The value of the payment as a non-zero positive integer (no decimals).
    /// Set to 0 for card verification (zero dollar authorization).
    var value: Int
    /// If enabled, it automatically captures the payment following the autoCapTime period.
    /// y = enable | n = disable
    var autoCapture: String?
    /// Set the delayed capture time in hours. Use values 0 to 168 (0 to 7 days).
    var autoCapTime: Float?
    /// Billing address information.
    var billingDetails: Address?
    /// Defines the Charge Mode.
    /// 1 = Non-3D | 2 = 3D
    var chargeMode: Int?
    /// Customer's IP address (e.g., 96.125.185.52)
    var customerIp: String?
    /// The name of the customer. Maximum characters: 100.
    var customerName: String?
    /// A description of the payment.
    var description: String?
    /// Specify the fail redirect URL.
    var failUrl: String?
//    var metadata: {String: String}?
    /// An array of Product information.
    var products: [Product]?
//    var recipientDetails: Any?
    /// If set to false, it allows the merchant to bypass all risk checks configured on the system (including blacklist).
    var riskCheck: Bool?
    /// Shipping address information.
    var shippingDetails: Address?
    /// Specify the success redirect URL.
    var successUrl: String?
    /// A unique ID set by the merchant. The track ID remains the same throughout the lifetime of the payment. Maximum characters: 50.
    var trackId: String?
    /// Type of transaction.
    /// 1 for regular, 2 for recurring, 3 for MOTO
    var transactionIndicator: String?
    /// User-defined fields 1 to 5. Maximum characters: 100.
    var udf1: String?
    var udf2: String?
    var udf3: String?
    var udf4: String?
    var udf5: String?
    
    init(cardToken: String, currency: String, value: Int) {
        self.cardToken = cardToken
        self.currency = currency
        self.value = value
    }
}
