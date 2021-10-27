class PhotoStringURL{
    let baseURL = "https://live.staticflickr.com/"
    
    var thumbnailPhotoStringURL:String
    var bigPhotoStringURL:String
    
    init (_ serverID:String,_ id:String,_ secret:String){
        self.thumbnailPhotoStringURL = self.baseURL+serverID+"/"+id+"_"+secret+"_n.jpg"
        self.bigPhotoStringURL = self.baseURL+serverID+"/"+id+"_"+secret+"_b.jpg"
    }
}

class APIStringURL {
    
    enum RequestType:String {
        case search = "search&"
        case getRecent = "getRecent&"
    }
    private let APIKey = "api_key=" + "e3341cb2f80fe39b8f09f6e384284d2f"
    private let baseURL = "https://www.flickr.com/services/rest/?method=flickr.photos."
    private let photosPerPage = "30"
    
    var urlString:String = ""
    var searchURLString:String = ""
    
    init(_ textForSearching: String){
        self.searchURLString = baseURL+RequestType.search.rawValue+APIKey+"&text="+textForSearching+"&per_page="+photosPerPage+"&page=1&format=json&nojsoncallback=1"
    }

    init(){
        self.urlString = baseURL+RequestType.getRecent.rawValue+APIKey+"&per_page="+photosPerPage+"&page=1&format=json&nojsoncallback=1"
    }
    
}

/*
 https://www.flickr.com/services/api/explore/flickr.photos.search
 https://www.flickr.com/services/api/flickr.photos.getRecent.html
 */
