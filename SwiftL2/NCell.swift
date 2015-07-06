import UIKit
//Протокол для нажатия кнопки на ячейки таблицы
protocol ClickDelegate:NSObjectProtocol{
    func clickBtnFromCell(cell:NCell)
}
//Класс ячейки
class NCell: UITableViewCell {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var delegate:ClickDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    //Обработчик по нажатию кнопки
    @IBAction func buttonTap(sender: UIButton) {
        self.delegate?.clickBtnFromCell(self)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
