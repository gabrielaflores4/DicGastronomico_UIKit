import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tabComida: UITableView!
    
     var nombresComidas: [String] = []

     let diccionarioComidas: [String: [String: String]] = [
         "Sushi": [
             "descripcion": "Plato japonés a base de arroz y pescado fresco.",
             "imagen": "sushi"
         ],
         "Sopa": [
             "descripcion": "Preparación líquida caliente con ingredientes variados.",
             "imagen": "soup"
         ],
         "Pizza": [
             "descripcion": "Masa horneada con queso, salsa de tomate e ingredientes.",
             "imagen": "pizza"
         ],
         "Pasta": [
             "descripcion": "Comida italiana hecha con trigo y acompañada de salsas.",
             "imagen": "pasta"
         ],
         "Macarons": [
             "descripcion": "Dulce francés hecho con almendra y relleno cremoso.",
             "imagen": "macarons"
         ],
         "Hamburguesa": [
             "descripcion": "Pan con carne, vegetales y salsas.",
             "imagen": "hamburguesa"
         ],
         "Pastel": [
             "descripcion": "Postre dulce horneado con crema o chocolate.",
             "imagen": "cake"
         ]
     ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()

        self.title = "Diccionario Gastronómico"

        tabComida.dataSource = self
        tabComida.delegate = self

        nombresComidas = Array(diccionarioComidas.keys)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return nombresComidas.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        let nombre = nombresComidas[indexPath.row]
        celda.textLabel?.text = nombre

        if let info = diccionarioComidas[nombre] {
            celda.imageView?.image = UIImage(named: info["imagen"]!)
            celda.detailTextLabel?.text = info["descripcion"]
        }

        celda.imageView?.contentMode = .scaleAspectFill
        celda.imageView?.clipsToBounds = true

        return celda
    }
}

