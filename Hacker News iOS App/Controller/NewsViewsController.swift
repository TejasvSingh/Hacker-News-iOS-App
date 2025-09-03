import UIKit

final class NewsViewController: UIViewController {
     let tableView = UITableView(frame: .zero, style: .plain)
    
    
    let objNews = Story.getNewsList()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.addSubview(tableView)
        view.backgroundColor = .black
        configureNavBar()
        configureTable()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { objNews.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
        cell.configure(with: objNews[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
