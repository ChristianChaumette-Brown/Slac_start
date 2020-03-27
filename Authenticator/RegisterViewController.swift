
import UIKit

class RegisterViewController: UIViewController {
    lazy var qrButton: UIButton = {
             let button = UIButton()
             button.setTitle("QRReader", for: .normal)
             button.setTitleColor(UIColor.white, for: .normal)
             button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
             button.layer.cornerRadius = 25
             button.translatesAutoresizingMaskIntoConstraints = false
             button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
             return button
         }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //view.isHidden = true
       
       // view.backgroundColor = UIColor.red
        view.addSubview(qrButton)
        qrButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        qrButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        qrButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        qrButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    @objc func onButtonPressed(_ sender: UIButton) {
           if sender == qrButton {
               let qrVC = ScannerViewController()
               self.navigationController?.pushViewController(qrVC, animated: true)
           }
          
       }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
