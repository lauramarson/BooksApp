//
//  AllBooksViewController.swift
//  studiosol_teste
//
//  Created by Laura Pinheiro Marson on 17/05/22.
//

import UIKit

protocol UpdateScrollViewProtocol: AnyObject {
    func updateHeight(height: CGFloat)
}

class AllBooksViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    weak var heightDelegate: UpdateScrollViewProtocol?
    weak var alertDelegate: ShowAlertProtocol?
    var allBooksVM = AllBooksViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "Book")
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        allBooksVM.getAllBooks { [weak self] (error) in
            if let error = error {
                guard let alert = self?.fetchAlert(title: "Erro ao carregar lista de livros", message: error) else {return}
                self?.alertDelegate?.alert(alert)
            } else {
                self?.tableView.reloadData()
                guard let newHeight = self?.tableView.contentSize.height else { return }
                self?.tableViewHeight.constant = newHeight
                self?.heightDelegate?.updateHeight(height: newHeight)
            }
        }
    }
}

extension AllBooksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBooksVM.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        let bookModel = allBooksVM.modelAt(indexPath.row)
        cell.bookCellVM = BookCellViewModel(bookModel)
        
        cell.configure()
        
        return cell
    }
}
    
extension AllBooksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }

        let bookID = allBooksVM.modelAt(indexPath.row).id
        dvc.detailVM = DetailBookViewModel(bookID: bookID)

        navigationController?.pushViewController(dvc, animated: true)
    }
}
