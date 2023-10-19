//
//  ItemTableViewCell.swift
//  ProyectoDAM2
//
//  Created by Kevin Yzquierdo on 17/10/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var txtTitulo: UILabel!
    
    @IBOutlet weak var txtDistrito: UILabel!
    
    @IBOutlet weak var txtDireccion: UILabel!
    
    @IBOutlet weak var txtDescripcion: UILabel!
    
    @IBOutlet weak var imgFoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
