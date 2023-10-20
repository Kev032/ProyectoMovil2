//
//  NoticiaTableViewCell.swift
//  ProyectoDAM2
//
//  Created by Josset Gutierrez Huaman on 19/10/23.
//

import UIKit

class NoticiaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblAutor: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblDescripcion: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
