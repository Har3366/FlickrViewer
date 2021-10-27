import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "collectionViewCell"
    
     let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
         imageView.contentMode = .scaleAspectFill
       return imageView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
