//
//  ViewController.swift
//  DropDown-Menu-in-UIKit
//
//  Created by andrei on 28.12.2023.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackButtonInSide: UIButton!
    @IBOutlet weak var stackTableInSide: UITableView!
    @IBOutlet weak var stackButtonPlusTable: UIStackView! // stack for button and table.
    
    var dayInWeek: [String] = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackTableInSide.isHidden = true
        
        stackTableInSide.dataSource = self
        stackTableInSide.delegate = self
        setView()
    }
    
    @IBAction func onClickDrop(_ sender: Any) {
        if stackTableInSide.isHidden {
            animate(toogle: true)
        } else {
            animate(toogle: false)
        }
    }
    
    func animate(toogle: Bool ){
        if toogle {
            UIView.animate(withDuration: 0.5, animations: {
                self.stackTableInSide.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.stackTableInSide.isHidden = true
            })
        }
    }
  
    func setView() {
        //MARK: установка графических параметров для стека, в котором находится кнопка и таблиц.
        stackButtonPlusTable.layer.cornerRadius = 10
        stackButtonPlusTable.layer.borderColor = UIColor.black.cgColor
        stackButtonPlusTable.layer.borderWidth = 1
        stackButtonPlusTable.layer.masksToBounds = true
        
//        stackButtonInSide.titleLabel?.font = UIFont(name: "Snell Roundhand", size: 40)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayInWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dayInWeek[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        stackButtonInSide.setTitle("\(dayInWeek[indexPath.row])", for: .normal)
        animate(toogle: false)
    }
}
