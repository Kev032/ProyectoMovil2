//
//  IngresarViewController.swift
//  ProyectoDAM2
//
//  Created by Kevin Yzquierdo on 17/10/23.
//

import UIKit
import Firebase

class IngresarViewController: UIViewController {
    
    @IBOutlet weak var txtCorreo: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnIngresar(_ sender: UIButton) {
        
        guard let email = txtCorreo.text else {return}
        guard let password = txtPassword.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (firebaseResult, error) in
            if let e = error {
                // Hubo un error en la autenticación, muestra una alerta
                let alertController = UIAlertController(title: "Error de autenticación", message: "Correo o contraseña incorrectos. Validar nuevamente.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                // Autenticación exitosa, deshabilita la navegación hacia atrás
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
                
                // Autenticación exitosa, redirige a la pantalla principal
                self.performSegue(withIdentifier: "principal", sender: self)
            }
        }
    }
}
