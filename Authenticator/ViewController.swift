

import UIKit

class ViewController: UIViewController {
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
   
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 142.0/255.0, green: 68.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var myLogin: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 30.00);
        text.text=""
        text.placeholder="Username"
        text.borderStyle=UITextField.BorderStyle.bezel
        text.backgroundColor=UIColor.blue
        text.textColor=UIColor.black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.cornerRadius = 25
        text.textAlignment = .center
        return text
    }()
  
    lazy var myPass: UITextField = {
          let text = UITextField()
          text.frame = CGRect(x: 0, y: 0, width: 300.00, height: 30.00);
          text.text=""
          text.placeholder="Password"
          text.borderStyle=UITextField.BorderStyle.bezel
          text.backgroundColor=UIColor.blue
          text.textColor=UIColor.black
          text.translatesAutoresizingMaskIntoConstraints = false
          text.layer.cornerRadius = 25
          text.textAlignment = .center
          text.isSecureTextEntry = true
          return text
      }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Create UITextField
       /*      let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00));
             
             // Or you can position UITextField in the center of the view
             myTextField.center = self.view.center
             
             // Set UITextField placeholder text
             myTextField.placeholder = "Place holder text"
             
             // Set text to UItextField
             myTextField.text = "UITextField example"
             
             // Set UITextField border style
        myTextField.borderStyle = UITextField.BorderStyle.line
             
             // Set UITextField background colour
             myTextField.backgroundColor = UIColor.white
             
             // Set UITextField text color
             myTextField.textColor = UIColor.blue
             
             
             // Add UITextField as a subview
             self.view.addSubview(myTextField)
        
        */
        //view.backgroundColor = UIColor.white
        folderBuild()
        view.addSubview(myLogin)
        view.addSubview(myPass)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        myLogin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        myLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myLogin.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        myPass.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        myPass.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myPass.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        //loginButton.bottomAnchor.constraint(equalTo: myLogin.bottomAnchor, constant: 60).isActive = true
        
        registerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 60).isActive = true
    }
    
    @objc func onButtonPressed(_ sender: UIButton) {
        if sender == loginButton && loginData[0].name==myLogin.text&&loginData[0].password==myPass.text{
            let loginVC = LoginViewController()
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        else if sender == registerButton {
            //let registerVC = RegisterViewController()
            //let registerVC = QRViewController()
            let registerVC = ScannerViewController()
            self.navigationController?.pushViewController(registerVC, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

