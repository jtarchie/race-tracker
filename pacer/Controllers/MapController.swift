import Foundation
import UIKit

class MapController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NYC Paces"
        self.view.addSubview(MapView(frame: self.view.bounds))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editRunnerScreen")
    }
    
    func editRunnerScreen() {
        var controller = EditRunnersController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}