//
//  ChurchVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 17/01/23.
//

import UIKit

class ChurchVC : UIViewController {
    
    @IBOutlet weak var title1 : UILabel!
    @IBOutlet weak var text1 : UILabel!
    @IBOutlet var title2: UILabel!
    @IBOutlet var subtitle1: UILabel!
    @IBOutlet var mision: UILabel!
    @IBOutlet var vision: UILabel!
    @IBOutlet var visiontext: UILabel!
    @IBOutlet var horarios: UILabel!
    @IBOutlet var horariostext: UILabel!
    @IBOutlet var text2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        title1.text = "ALIENTO DE VIDA "
        
        text1.text = "Aliento de Vida es una congregacion creada en el corazón de Dios, para que las personas y familias en Yucatán, México y el mundo de habla hispana, tengan un lugar donde puedan adorar a Jesucristo con libertad, recibir una palabra que transforme su vida y celebrar con nosotros la presencia de Dios. Nos sentimos honrados con tu visita, la familia de Aliento te da la bienvenida."
        
        title2.text = "Nosotros"
        subtitle1.text = "Misión"
        mision.text = " • Ganar almas para Jesús. \n • Formar lideres. \n • Provocar un avivamiento. "
        vision.text = "Visión"
        visiontext.text = "Ser una iglesia con rostro a la sociedad, que ayude a la comunidad y bendiga la gente, buscando una transformación día a día a través de principios biblicos (la palabra de Dios) y el poder del Espíritu Santo."
        horarios.text = "Horarios"
        horariostext.text = "Domingos 10 am y 12 pm"
        text2.text = "¡Mira nuestra transmisión online!"
        
        setNavBarLogo()
        
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
        
    }
    
}
