import UIKit

class ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,ClickDelegate {
    
    @IBOutlet weak var tabView: UITableView!
    
    //DataSource для таблицы (данные отображаемые в талице)
    var names = [User(name: "Alex", age: 25),User(name: "Pavel", age: 40),User(name: "Ivan", age: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //Количество секций в таблице
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    //Количество ячеек в секции
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return names.count
    }
    //Высота заголовка секции
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    //Инициализация ячейки таблицы
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: NCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NCell
        cell.nameLabel.text = names[indexPath.row].name
        cell.ageLabel.text = names[indexPath.row].ageIsOptionalType(names[indexPath.row].age)
        cell.delegate = self
        return cell
    }
    //Обработчик нажатия на ячейку таблицы
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIAlertView(title: "Hello From TableView", message: "\(indexPath.section) Row \(indexPath.row)", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "Add New").show()
    }
    
    //Обработчик нажатия кнопок АлертВью
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1{
            names.append(User(name: "New Elem", age: 50))
        }
        self.tabView.reloadData()
    }
    //Обработчик кнопки в ячейке таблицы
    func clickBtnFromCell(cell: NCell) {
        cell.nameLabel.text = cell.nameLabel.text?.toUpper()
        // Преобразуем в целочисленное значение строку
        var ageInt = cell.ageLabel.text?.toInt()
        
        if ageInt == nil {   // Если возраст = nil
            cell.ageLabel.text = "1"  // То делаем его равным единице
        }
        else {   // Иначе прибавляем 1
            cell.ageLabel.text = String(ageInt!+1)
        }
    }
    
    
}

