//
//  RegistrarViewController.swift
//  ProyectoDAM2
//
//  Created by Kevin Yzquierdo on 17/10/23.
//

import UIKit
import Firebase

class RegistrarViewController: UIViewController {
    
    @IBOutlet weak var txtCorreo: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func btnNuevo(_ sender: UIButton) {
        
        guard let email = txtCorreo.text else {return}
        guard let password = txtPassword.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print ("error")
            }
            else{
                // Se redirecciona a la pantalla principal
                self.performSegue(withIdentifier: "redireccionar", sender: self)
            }
        }
    }
}
