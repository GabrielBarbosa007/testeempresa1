
import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    private var user: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableViewProtocols()
        APIService.shared.getData { result in
            
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.user = users
                    self.tableView.reloadData()
                }
                case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureTableViewProtocols() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserCell
        cell?.setupCell(user: user[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
        
    }
}
