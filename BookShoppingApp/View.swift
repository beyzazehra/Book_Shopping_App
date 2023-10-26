import UIKit

class MyScreen:  UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        arrangeFrames(view: view)
        addViews(view:view)
        view.backgroundColor = .white
    }
}
let greetingLabel: UILabel = {
    let greetingLabel = UILabel()
    greetingLabel.text = "Good morning, Beyza!"
    greetingLabel.font = UIFont.boldSystemFont(ofSize: 22)
    return greetingLabel
}()

let secondLabel: UILabel = {
    let secondLabel = UILabel()
    secondLabel.text = "Ship to"
    secondLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    secondLabel.textColor = UIColor.gray
    secondLabel.alpha = 0.7
    return secondLabel
}()

let thirdLabel: UILabel = {
    let thirdLabel = UILabel()
    let chevron = NSMutableAttributedString(string: "Current Location", attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .regular),
        NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(2)
    ])
    let arrow = NSMutableAttributedString(string: "\u{2304}", attributes: [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 32)!])
    
    let blueColor = UIColor.blue
    arrow.addAttributes([NSAttributedString.Key.foregroundColor: blueColor], range: NSMakeRange(0, arrow.length))
    
    let combination = NSMutableAttributedString()
    combination.append(chevron)
    combination.append(arrow)
    thirdLabel.attributedText =  combination
    return thirdLabel
}()

let firstButton : UIButton = {
    let firstButton = UIButton()
    let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
    let boldSearch = UIImage(systemName: "cart.fill", withConfiguration: boldConfig)
    firstButton.setImage(boldSearch, for: .normal)
    return firstButton
}()

let searchBar : UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "Search Books, Authors"
    searchBar.searchBarStyle = .minimal
    searchBar.isUserInteractionEnabled = true
    return searchBar
}()

let horizontalScrollView : UIScrollView = {
    let horizontalScrollView = UIScrollView()
    let bookGenres = ["Fiction", "Novel", "History", "Biography", "Poetry", "Horror", "Classics"]
    let genreImages = ["fiction", "novel", "history", "biography", "poetry", "horror", "classics"]
    let imageWidth: CGFloat = 80
    let imageHeight: CGFloat = 80
    
    
    for (index, genre) in bookGenres.enumerated() {
        let genreImageView = UIImageView(frame: CGRect(x: CGFloat(index) * (imageWidth + 20), y: 0, width: imageWidth, height: imageHeight))
        
        let horizontalContentWidth = imageWidth * CGFloat(bookGenres.count)
        genreImageView.image = UIImage(named: genreImages[index])
        genreImageView.layer.cornerRadius = 10
        genreImageView.clipsToBounds = true
        
        horizontalScrollView.addSubview(genreImageView)
        
        let genreLabel = UILabel(frame: CGRect(x: CGFloat(index) * (imageWidth + 20 ), y: imageHeight, width: imageWidth, height: 20))
        genreLabel.text = genre
        genreLabel.textAlignment = .center
        horizontalScrollView.addSubview(genreLabel)
        horizontalScrollView.contentSize = CGSize(width: horizontalContentWidth, height: imageHeight + 20)
        
    }
    horizontalScrollView.showsHorizontalScrollIndicator = false
    horizontalScrollView.isPagingEnabled = true
    return horizontalScrollView
}()

let authorLabel : UILabel = {
    let authorLabel = UILabel()
    authorLabel.text = "Popular Authors"
    authorLabel.font = UIFont.boldSystemFont(ofSize: 22)
    return authorLabel
}()

let secondButton : UIButton = {
    let secondButton = UIButton()
    secondButton.setTitle("View All", for: .normal)
    secondButton.setTitleColor(.blue, for: .normal)
    return secondButton
    
}()
func arrangeFrames(view:UIView) {
    greetingLabel.frame = CGRect(x: 20, y: 70, width: view.frame.width - 40, height: 30)
    secondLabel.frame = CGRect(x: 20, y: 110, width: view.frame.width - 40, height: 30)
    thirdLabel.frame = CGRect(x: 20, y: 112, width: view.frame.width - 40, height: 40)
    firstButton.frame = CGRect(x: 180, y: 70, width: view.frame.width - 40, height: 30)
    searchBar.frame = CGRect(x: 5, y: 170, width: view.frame.width - 10, height: 34)
    horizontalScrollView.frame = CGRect(x: 0, y: searchBar.frame.maxY + 20, width: view.frame.width, height: 150)
    authorLabel.frame = CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 30)
    secondButton.frame = CGRect(x: 170 , y: 350, width: view.frame.width - 40, height: 30)
}

func addViews(view:UIView) {
    view.addSubview(greetingLabel)
    view.addSubview(secondLabel)
    view.addSubview(thirdLabel)
    view.addSubview(firstButton)
    view.addSubview(searchBar)
    view.addSubview(horizontalScrollView)
    view.addSubview(authorLabel)
    view.addSubview(secondButton)
}


