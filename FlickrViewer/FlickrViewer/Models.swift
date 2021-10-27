
struct APIRequest: Codable {
    let photos:Photos
    let stat: String
    
}

struct Photos: Codable {
    let page:Int
    let total:Int
    var photo = [Photo]()
}

struct Photo:Codable {
    let id: String
    let secret: String
    let server: String
    let title: String
}
