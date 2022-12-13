//
//  ViewController.swift
//  ListApp
//
//  Created by Hakan Sezer on 13.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alertController = UIAlertController()
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defualtCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    @IBAction func didRemoveBarButtonItemTapped(_ sender:UIBarButtonItem) {
        presentAlert(title: "Uyarı",
                     massage: "Listeyi Silmek İstedinize Emin Misiniz?",
                     defualtButtonTitle: "Evet",
                     cancelButtonTitle: "Hayır") { _ in
            self.data.removeAll()
            self.tableView.reloadData()
            
        }
    }
    
    @IBAction func didAddBarButtonItem (_ sender: UIBarButtonItem) {
        //Func - AddAlert
        presentAlert()
        
    }
    
    func presentAlert() {
        /*
         let alertController = UIAlertController(title: "Yeni Ekleme",
         message: nil,
         preferredStyle: .alert)
         
         let defaultButton = UIAlertAction(title: "Ekle",
         style: .default){ _ in
         
         let textController = alertController.textFields?.first?.text
         
         if textController != ""{
         self.data.append((textController)!)
         self.tableView.reloadData()
         }else {
         //Func - WarningAlert
         self.presentWarningAlert()
         }
         }
         
         let alertButton = UIAlertAction(title: "Vazgeç", style: .cancel)
         
         alertController.addTextField()
         alertController.addAction(defaultButton)
         alertController.addAction(alertButton)
         present(alertController, animated: true)
         */
        presentAlert(title:"Yeni Eleman Ekle ",
                     massage: nil,
                     defualtButtonTitle: "Ekle",
                     cancelButtonTitle: "Vazgeç",
                     isTextFieldAvailable: true,
                     defualtButtonHandler: { _ in
            let textController = self.alertController.textFields?.first?.text
            
            if textController != ""{
                self.data.append((textController)!)
                self.tableView.reloadData()
            }else {
                //Func - WarningAlert
                self.presentWarningAlert()
            }
        } )
        
    }
    
    // MARK: Func - Warning Alert
    func presentWarningAlert() {
        let popHap = UIAlertController(title: "Hata!",
                                       message: "List'ye Boş Bir eleman Eklenemez.",
                                       preferredStyle: .alert)
        
        let alertButton = UIAlertAction(title: "Çıkış", style: .cancel)
        popHap.addAction(alertButton)
        present(popHap, animated: true)
    }
    
    
    // MARK: Func - Present Alert
    func presentAlert (title: String?,
                       massage:String?,
                       preferredStyle: UIAlertController.Style = .alert,
                       defualtButtonTitle: String? = nil,
                       cancelButtonTitle: String?,
                       isTextFieldAvailable: Bool = false,
                       defualtButtonHandler: ((UIAlertAction) -> Void)? = nil) {
        
        alertController = UIAlertController(title: title,
                                   message: massage,
                                       preferredStyle: preferredStyle)
        
        if defualtButtonTitle != nil {
            let defualtButton = UIAlertAction(title: defualtButtonTitle, style: .default, handler: defualtButtonHandler)
            
            alertController.addAction(defualtButton)
        }
        
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel)
        
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        
        alertController.addAction(cancelButton)
        
        
        present(alertController, animated: true)
        
    }
    
    /*
     //MARK: Cancel Alert
     func cancelDel() -> UIAlertAction {
     return UIAlertAction(title: "Vazgeç", style: .cancel)
     
     }
     */
    /*
     func alertController() -> UIAlertController {
     return UIAlertController(title: "Yeni Ekleme", message: nil, preferredStyle: .)
     }
     */
    
}

