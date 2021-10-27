import UIKit
import Kingfisher

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let serverID = photoArray[indexPath.row].server
        let id = photoArray[indexPath.row].id
        let secret = photoArray[indexPath.row].secret
        let thumbnailPhotoStringURL = PhotoStringURL(serverID,id,secret).thumbnailPhotoStringURL
        let thumbnailPhotoURL = URL(string:thumbnailPhotoStringURL)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        cell.imageView.kf.setImage(with:thumbnailPhotoURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let serverID = photoArray[indexPath.row].server
        let id = photoArray[indexPath.row].id
        let secret = photoArray[indexPath.row].secret
        let bigPhotoStringURL = PhotoStringURL(serverID,id,secret).bigPhotoStringURL
        let bigPhotoURL = URL(string:bigPhotoStringURL)
        
        let rootVC = BigImageController()
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.imageView.kf.setImage(with:bigPhotoURL)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = true
        if let searchBarText = searchBar.text {
            Requests.photoRequest(self,searchBarText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        Requests.photoRequest(self)
    }
}
