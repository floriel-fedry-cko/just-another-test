import Vapor

struct Customer: Codable {
    /// The unique identifier for this `Customer`.
    var id: String?
    
    /// The UTC date and time expressed according to ISO 8601.
    /// (e.g., 2015-11-05T13:10:30Z or 2015-11-05T08:10:30-05:00)
    var created: String
    
    /// An array of card objects
    var cards: CardList
    
    /// The card ID of the customer's default card
    var defaultCard: String
    
    /// The description specified in the request.
    var description: String?
    
    /// The customer's email address.
    var email: String
    
    /// Defined as:
    /// - true if the live keys were used in the request.
    /// - false if the test keys were used in the request.
    var livemode: Bool
    
    /// The customer's name.
    var name: String?
    
    /// Phone number of the customer.
    var phone: Phone
}
