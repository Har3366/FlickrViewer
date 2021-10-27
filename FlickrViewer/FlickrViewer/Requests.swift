import UIKit
import Alamofire

class Requests {
    // base,main request for main view
    public static func photoRequest(_ vc:ViewController,_ searchBarText:String) {
        var textForSearching = searchBarText
        let searchArray = textForSearching.components(separatedBy: " ")
        if searchArray.count > 1 {
            textForSearching = searchBarText.replacingOccurrences(of: " ", with: "+")
        }
        let searchURLString = APIStringURL(textForSearching).searchURLString
        let request = AF.request(searchURLString)
        request.validate().responseDecodable(of: APIRequest.self){response in
            guard let miscPhotosInfo = response.value, response.error == nil else {
                if let errorTextDiscription = response.error?.errorDescription {
                    print (errorTextDiscription)
                }
                
                return
            }
            print(miscPhotosInfo.stat)
            vc.miscPhotos = miscPhotosInfo
            vc.photoArray = miscPhotosInfo.photos.photo
            vc.collectionView?.reloadData()
        }
    }
    //searcing request
    public static func photoRequest(_ vc:ViewController) {
        let urlString = APIStringURL().urlString
        let request = AF.request(urlString)
        request.validate().responseDecodable(of: APIRequest.self){response in
            guard let miscPhotosInfo = response.value, response.error == nil else {
                if let errorTextDiscription = response.error?.errorDescription {
                    print (errorTextDiscription)
                }
                
                return
            }
            print(miscPhotosInfo.stat)
            vc.miscPhotos = miscPhotosInfo
            vc.photoArray = miscPhotosInfo.photos.photo
            vc.collectionView?.reloadData()
        }
    }
}


