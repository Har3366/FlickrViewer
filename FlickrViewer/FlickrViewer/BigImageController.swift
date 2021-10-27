//view for individual chosen photo presentation
import UIKit

class BigImageController: UIViewController {
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(backToMainView))
        navigationItem.rightBarButtonItem?.image = UIImage(systemName: "globe.badge.chevron.backward")
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
    
    @objc func backToMainView(){
        dismiss(animated: false)
    }
}
