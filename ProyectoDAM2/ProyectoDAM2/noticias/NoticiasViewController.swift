//
//  NoticiasViewController.swift
//  ProyectoDAM2
//
//  Created by Josset Gutierrez Huaman on 19/10/23.
//

import UIKit

class NoticiasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tvNoticias: UITableView!
    var listaNoticias:[Noticia] = []
    var posNoti = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarNoticias()
        
        tvNoticias.dataSource = self
        tvNoticias.delegate = self
        
        tvNoticias.rowHeight = 240
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaNoticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vista = tvNoticias.dequeueReusableCell(withIdentifier: "cell") as! NoticiaTableViewCell
        vista.lblTitulo.text = String(listaNoticias[indexPath.row].title)
        vista.lblAutor.text = String(listaNoticias[indexPath.row].author ?? "")
        vista.lblUrl.text = String(listaNoticias[indexPath.row].url)
        vista.lblDescripcion.text = String(listaNoticias[indexPath.row].description)
        vista.img.image = UIImage(named: String(indexPath.row + 1))
        
        return vista
    }
    
    
    func cargarNoticias(){
        let URLAPI = "https://newsapi.org/v2/everything?apiKey=f431eb957dc54d758bd9e41d9193bea1&q=emergency&pageSize=10"
        let url = URL(string: URLAPI)
        
        let tarea = URLSession.shared.dataTask(with: url!){
            [weak self] (data, response, error) in
            
            guard let data = data, error == nil else {
                print("Error al obtener datos: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                self?.listaNoticias = newsResponse.articles

                print(self!.listaNoticias)
                
                //Proceso en segundo plano
                DispatchQueue.main.async {
                    self!.tvNoticias.reloadData()
                }

                    
            } catch {
                print(error)
                print(error.localizedDescription)
            }
    }
    
    //Iniciar tarea
    tarea.resume()
    }
}
