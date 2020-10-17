
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

	@IBOutlet weak var shapeTableView: UITableView!
	
	var shapeList = [Shape]()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		initList()
	}
	
	func initList()
	{
		let circle = Shape(id: "0", name: "Circle 1", imageName: "circle")
		shapeList.append(circle)
		
		let square = Shape(id: "1", name: "Square 1", imageName: "square")
		shapeList.append(square)
		
		let octagon = Shape(id: "2", name: "Octagon 1", imageName: "octagon")
		shapeList.append(octagon)
		
		let rectangle = Shape(id: "3", name: "Rectangle 1", imageName: "rectangle")
		shapeList.append(rectangle)
		
		let triangle = Shape(id: "4", name: "Triangle 1", imageName: "triangle")
		shapeList.append(triangle)
		
		let circle2 = Shape(id: "5", name: "Circle 2", imageName: "circle")
		shapeList.append(circle2)
		
		let square2 = Shape(id: "6", name: "Square 2", imageName: "square")
		shapeList.append(square2)
		
		let octagon2 = Shape(id: "7", name: "Octagon 2", imageName: "octagon")
		shapeList.append(octagon2)
		
		let rectangle2 = Shape(id: "8", name: "Rectangle 2", imageName: "rectangle")
		shapeList.append(rectangle2)
		
		let triangle2 = Shape(id: "9", name: "Triangle 2", imageName: "triangle")
		shapeList.append(triangle2)
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return shapeList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
		
		let thisShape = shapeList[indexPath.row]
		
		tableViewCell.shapeName.text = thisShape.id + " " + thisShape.name
		tableViewCell.shapeImage.image = UIImage(named: thisShape.imageName)
		
		return tableViewCell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		self.performSegue(withIdentifier: "detailSegue", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if(segue.identifier == "detailSegue")
		{
			let indexPath = self.shapeTableView.indexPathForSelectedRow!
			
			let tableViewDetail = segue.destination as? TableViewDetail
			
			let selectedShape = shapeList[indexPath.row]
			
			tableViewDetail!.selectedShape = selectedShape
			
			self.shapeTableView.deselectRow(at: indexPath, animated: true)
		}
	}

}

