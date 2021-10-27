import UIKit
import Alamofire

class ViewController: UIViewController {
   
    var miscPhotos:APIRequest? // API model type
    var photoArray = [Photo]() // entire API model type
    var collectionView: UICollectionView? // main view for photos presentation
    let searchBar = UISearchBar() // search bar for main view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionView: UICollectionView = {
            let layout  = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .systemBackground
            let itemSize = view.frame.size.width / 2
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.itemSize = CGSize(width: itemSize-0.5, height: itemSize)
            return collectionView
        }()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        
        searchBar.placeholder = "Enter search request..."
        searchBar.backgroundColor = .systemBackground
        let searchBarStyle = searchBar.value(forKey: "searchField") as? UITextField
        searchBarStyle?.clearButtonMode = .never
        
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.collectionView = collectionView
        
        view.addSubview(collectionView)
        view.addSubview(searchBar)
    
    Requests.photoRequest(self) // 
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.frame = CGRect(x: 5, y: view.safeAreaInsets.top, width: view.frame.size.width-10, height: 45)
        collectionView?.frame = CGRect(x: 0,y:view.safeAreaInsets.top+55 ,width: view.frame.size.width,height: view.frame.size.height-45)
    }
}

