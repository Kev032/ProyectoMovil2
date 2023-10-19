//
//  TableViewController.swift
//  ProyectoDAM2
//
//  Created by Kevin Yzquierdo on 17/10/23.
//

import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tvComunidad: UITableView!
    
    var comunidadData = [comunidad]()
        var firestore: Firestore!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        firestore = Firestore.firestore()
        
        // Llama a una función para cargar los datos de Firestore
        tvComunidad.dataSource = self
        //
        tvComunidad.delegate = self
        // Tamaño de la celda
        tvComunidad.rowHeight = 450
        
        cargarData()
    }
    
    func cargarData() {
        // Realiza una consulta a la colección "comunidad" en Firestore
        firestore.collection("comunidad").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error al obtener datos de Firestore: \(error)")
            } else {
                // Borra los datos actuales antes de cargar nuevos datos
                self.comunidadData.removeAll()
                
                // Itera a través de los documentos y agrega los datos a tu array
                for document in querySnapshot!.documents {
                    if let titulo = document.data()["titulo"] as? String,
                       let distrito = document.data()["distrito"] as? String,
                       let direccion = document.data()["direccion"] as? String,
                       let descripcion = document.data()["descripcion"] as? String,
                       let imagen = document.data()["imagen"] as? String {
                        let comunidadItem = comunidad(titulo: titulo, distrito: distrito, direccion: direccion, descripcion: descripcion, imagen: imagen)
                        self.comunidadData.append(comunidadItem)
                    }
                }
                
                // Recarga la tabla con los nuevos datos
                self.tvComunidad.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comunidadData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> 	UITableViewCell {
        // Acceder al identificador
        let vista = tvComunidad.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ItemTableViewCell
        
        // Configurar la celda con los datos de la comunidad
        let item = comunidadData[indexPath.row]
        vista.txtTitulo.text = item.titulo
        vista.txtDistrito.text = item.distrito
        vista.txtDireccion.text = item.direccion
        vista.txtDescripcion.text = item.descripcion
        
        // Cargar la imagen
        
        if let imageUrl = URL(string: item.imagen) {
            // Cargar la imagen de forma asincrónica
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                if let error = error {
                    print("Error al cargar la imagen: \(error)")
                    return
                }
                
                if let data = data {
                    // Asegúrate de actualizar la interfaz de usuario en el hilo principal
                    DispatchQueue.main.async {
                        vista.imgFoto.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
        /*if let imageUrl = URL(string: item.imagen) {
            if let data = try? Data(contentsOf: imageUrl) {
                vista.imgFoto.image = UIImage(data: data)
            }
        }*/
        
        return vista
    }


}
